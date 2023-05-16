import win32.win32gui as win32gui
import win32ui
import sys
from ctypes import windll
from PIL import Image

def sshot(client):
	hwnd = win32gui.FindWindow(None, client)
	left, top, right, bot = win32gui.GetWindowRect(hwnd)
	w = right - left
	h = bot - top
	hwndDC = win32gui.GetWindowDC(hwnd)
	mfcDC  = win32ui.CreateDCFromHandle(hwndDC)
	saveDC = mfcDC.CreateCompatibleDC()
	saveBitMap = win32ui.CreateBitmap()
	saveBitMap.CreateCompatibleBitmap(mfcDC, w, h)
	saveDC.SelectObject(saveBitMap)
	result = windll.user32.PrintWindow(hwnd, saveDC.GetSafeHdc(), 3)
	bmpinfo = saveBitMap.GetInfo()
	bmpstr = saveBitMap.GetBitmapBits(True)
	im = Image.frombuffer(
 	   'RGB',
	    (bmpinfo['bmWidth'], bmpinfo['bmHeight']),
    	bmpstr, 'raw', 'BGRX', 0, 1)

	win32gui.DeleteObject(saveBitMap.GetHandle())
	saveDC.DeleteDC()
	mfcDC.DeleteDC()
	win32gui.ReleaseDC(hwnd, hwndDC)
         
	if result == 1:
  		im.save(client + ".png")
        
if __name__ == '__main__':
    sshot(sys.argv[1])
    