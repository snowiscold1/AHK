checkbearfaceslot:

bearface :="|<>*100$19.3000k00C0800A0000c3UQ1kC0s30Q00+"
bearfaceslave :="|<>**50$15.300A6000000UXzwFUXk64BMUu62IcLU"

if (ok:=FindText(105, 64, 143, 96, 0, 0, bearface))
{
tpslot = 1	

jumperavatar := [101, 42, 149, 80,"|<>**50$9.ck2002MEBcA3U"] ; done
jumperavatarfollow :=[101, 42, 149, 80,"|<>**50$3.k0BhU"] ;done
}

if (ok:=FindText(157, 57, 199, 95, 0, 0, bearface))
{
tpslot = 2

jumperavatar := [158, 44, 206, 90,"|<>**50$9.oQ1UA1YA6o4"] ; done
jumperavatarfollow :=[158, 44, 206, 90,"|<>**50$3.k2BjU"] ; done
}

if (ok:=FindText(66, 543, 100, 571, 0, 0, bearfaceslave))
{
tpslotslave = 1	

jumperavatarslave := [66, 531, 100, 565,"|<>**50$6.lU13cU"] ;done
jumperavatarfollowslave := [66, 531, 100, 565,"|<>**50$3.t/g"] ; done

}

if (ok:=FindText(106, 537, 134, 567, 0, 0, bearfaceslave))
{
tpslotslave = 2

jumperavatarslave := [104, 531, 138, 559,"|<>**50$8.lM62Xe+|<>**50$5.l24OE"] ;done
jumperavatarfollowslave := [104, 531, 138, 559,"|<>**50$4.Y1rs"] ;done
}

