Return-Path: <SRS0=hSf9=SL=gk2.net=gandalf@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A587C433EF
	for <linux-firmware@archiver.kernel.org>; Thu, 27 Jan 2022 01:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2252C340E3; Thu, 27 Jan 2022 01:14:10 +0000 (UTC)
Received: from 5.mo575.mail-out.ovh.net (5.mo575.mail-out.ovh.net [46.105.62.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BB7DC340E9
	for <linux-firmware@kernel.org>; Thu, 27 Jan 2022 01:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6BB7DC340E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=gk2.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gk2.net
Received: from player693.ha.ovh.net (unknown [10.110.103.200])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id B5AFE21A62
	for <linux-firmware@kernel.org>; Thu, 27 Jan 2022 01:13:56 +0000 (UTC)
Received: from gk2.net (82-65-221-177.subs.proxad.net [82.65.221.177])
	(Authenticated sender: gerald@gk2.net)
	by player693.ha.ovh.net (Postfix) with ESMTPSA id 0423326B447FE;
	Thu, 27 Jan 2022 01:13:43 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-103G005ea2ab429-9ca2-4817-80b7-410faa7aa367,
                    7BBB4ECDC12A14F10EAF31C2B2D8AAE1BDE7D8CD) smtp.auth=gerald@gk2.net
X-OVh-ClientIp:82.65.221.177
Content-Type: multipart/alternative; boundary=Apple-Mail-8456AF67-9E35-481E-8D9E-B7D85D14CE43
Content-Transfer-Encoding: 7bit
From: =?utf-8?Q?G=C3=A9rald_Kerma?= <gandalf@gk2.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is buggy
Date: Thu, 27 Jan 2022 02:13:41 +0100
Message-Id: <F5C43A0B-D9CC-46F2-9DC6-4B396D9EDFAD@gk2.net>
References: <AS8PR04MB8419C8377C9458ADA340AC24E0209@AS8PR04MB8419.eurprd04.prod.outlook.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: =?utf-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Prashanth Ranganathan <prashanthkrishnan.ranganathan@nxp.com>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>,
 Rakesh Parmar <rakesh.parmar@nxp.com>, Cathy Luo <xiaohua.luo@nxp.com>,
 Linux Firmware <linux-firmware@kernel.org>,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 Josh Boyer <jwboyer@kernel.org>
In-Reply-To: <AS8PR04MB8419C8377C9458ADA340AC24E0209@AS8PR04MB8419.eurprd04.prod.outlook.com>
To: James Cao <james.cao@nxp.com>
X-Mailer: iPad Mail (19A346)
X-Ovh-Tracer-Id: 17425552861984447317
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrfedvgdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegtgffhggfufffkfhgjvffosegrjehmrehhtddunecuhfhrohhmpefirohrrghluggpmfgvrhhmrgcuoehgrghnuggrlhhfsehgkhdvrdhnvghtqeenucggtffrrghtthgvrhhnpeduvedvjedttefgtdevgfeuvedvieetffevhfeltdelkeeggeegjedukeffgfdtieenucffohhmrghinhepohhuthhlohhokhdrtghomhdpghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpkedvrdeihedrvddvuddrudejjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrieelfedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrghnuggrlhhfsehgkhdvrdhnvghtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqfhhirhhmfigrrhgvsehkvghrnhgvlhdrohhrgh


--Apple-Mail-8456AF67-9E35-481E-8D9E-B7D85D14CE43
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

H=C3=A9llo James,

Was it only ever supported ?

May be NXP can free and share the firmware source to the community, and let a=
nyone who care try to debug it ?

As far as my tests shown, the mwifiex driver never has work correctly, and n=
one version is sufficiently stable to be state as working.

Please, NXP, take cares of your end clients !
Be simple, be smart, be respectuous, give us the source=E2=80=A6

Thanks in advance,
G=C3=A9rald Kerma

[%]<\@~{

> Le 27 janv. 2022 =C3=A0 00:28, James Cao <james.cao@nxp.com> a =C3=A9crit :=

>=20
> =EF=BB=BF
> Hi Pali,
>=20
> NXP doesn't have a plan to support mwifiex driver anymore. How should we h=
andle this kind of retired project in upstream?
>=20
> Thanks,
> James
>=20
> From: Pali Roh=C3=A1r <pali@kernel.org>
> Sent: Thursday, January 20, 2022 11:30 AM
> To: Prashanth Ranganathan <prashanthkrishnan.ranganathan@nxp.com>
> Cc: Sharvari Harisangam <sharvari.harisangam@nxp.com>; Rakesh Parmar <rake=
sh.parmar@nxp.com>; Cathy Luo <xiaohua.luo@nxp.com>; James Cao <james.cao@nx=
p.com>; Linux Firmware <linux-firmware@kernel.org>; Linux Wireless <linux-wi=
reless@vger.kernel.org>; G=C3=A9rald Kerma <gandalf@gk2.net>; Ganapathi Bhat=
 <ganapathi017@gmail.com>; Josh Boyer <jwboyer@kernel.org>
> Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware is b=
uggy
> =20
> Caution: EXT Email
>=20
> Hello Prashanth!
>=20
> Thank you for reply. Did you have a time to check this issue?
>=20
> G=C3=A9rald did a great testing which shows that version W16.68.1.p195 and=

> higher of pcieuart8997_combo_v4.bin firmware does not work.
>=20
> On Friday 14 January 2022 17:11:18 Prashanth Ranganathan wrote:
> > Hi Pali,
> > Please allow me to check this and respond ASAP.
> > Best,
> > Prashanth
> > ________________________________
> > From: Pali Roh=C3=A1r <pali@kernel.org>
> > Sent: Friday, January 14, 2022 9:00 AM
> > To: Sharvari Harisangam <sharvari.harisangam@nxp.com>; Rakesh Parmar <ra=
kesh.parmar@nxp.com>; Cathy Luo <xiaohua.luo@nxp.com>; Prashanth Ranganathan=
 <prashanthkrishnan.ranganathan@nxp.com>; James Cao <james.cao@nxp.com>
> > Cc: Linux Firmware <linux-firmware@kernel.org>; Linux Wireless <linux-wi=
reless@vger.kernel.org>; G=C3=A9rald Kerma <gandalf@gk2.net>; Ganapathi Bhat=
 <ganapathi017@gmail.com>; Josh Boyer <jwboyer@kernel.org>
> > Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware i=
s buggy
> >
> > Caution: EXT Email
> >
> > NXP people: Sharvari, Rakesh, Cathy, Zheng: could you please look at
> > this issue? It is really serous!
> >
> > On Monday 27 September 2021 09:47:23 Josh Boyer wrote:
> > > On Sun, Sep 26, 2021 at 6:43 AM Pali Roh=C3=A1r <pali@kernel.org> wrot=
e:
> > > >
> > > > Hello Josh, Sharvari and other from NXP!
> > > >
> > > > On Saturday 25 September 2021 19:23:48 G=C3=A9rald Kerma wrote:
> > > > > Correcting old marvell address to new nxp...
> > > > >
> > > > > Le 25/09/2021 =C3=A0 19:19, G=C3=A9rald Kerma a =C3=A9crit :
> > > > > > H=C3=A9llo All,
> > > > > >
> > > > > > I made some few tests on EspressoBin-Ultra from GlobalScaleTechn=
ologies,
> > > > > > because of problem with the WiFi.
> > > > > >
> > > > > > I have done some quick tests on all the firmware of PCIEUSB-8997=
 using
> > > > > > the pcieuart8997_combo_v4.bin on OpenWrt 21.02.x
> > > > > >
> > > > > > Here is a summary of the tests :
> > > > > > - W16.68.10.p159 =3D KO
> > > > > > - W16.68.1.p195 =3D KO
> > > > > > - V16.68.1.p145 =3D OK
> > > > > > - 16.68.1.p140 =3D OK
> > > > > > - 16.68.1.p133 =3D OK
> > > > > > - 16.68.1.p97 =3D OK
> > > > > > - 16.68.1.p70 =3D KO
> > > >
> > > > =46rom this user test result can be seen that last two versions of
> > > > pcieusb8997_combo_v4.bin firmware file for 8997 wifi+bt card with
> > > > official mainline linux kernel driver mwifiex were not properly test=
ed
> > > > internally in NXP and are causing serious issues which make 8997 car=
d
> > > > basically unusable.
> > > >
> > > > Sharvari and other NXP developers: Do you have some internal testing=
 of
> > > > this pcieusb8997_combo_v4.bin firmware for PCIe+USB variant of 8997
> > > > wifi chips? Or are you aware of this issue and do you have in NXP so=
me
> > > > workaround for it (e.g. at driver level)? Could you please look at t=
his
> > > > serious issue and try to debug firmware and release a new version, a=
s
> > > > this is obvious fatal error in firmware itself?
> > > >
> > > > Josh, how you in linux-firmware repository handle such, I must say,
> > > > "fatal issues"? Wait for vendor fixes or revert problematic commits?=
 Or
> > > > something else?
> > >
> > > We can revert if we need to, but I think it's not quite that simple.
> > >
> > > > Because when users starts upgrading linux-firmware packages in their=

> > > > downstream distributions then basically wifi cards on this 8997 chip=
s
> > > > with official mwifiex driver stops working.
> > >
> > > The first broken version was committed in Feb of 2019.  That's
> > > approaching 3 years ago.  Given that this is binary firmware, I have
> > > no idea what else may or may not be included in the updates in the
> > > meantime.
> > >
> > > josh
> >
> > Josh, as G=C3=A9rald wrote, current binary in linux-firmware repository i=
s
> > unusable. And there is no reply from NXP for 3 months.
> >
> > You are right that nobody knows what is in firmware binary, but working
> > binary is at least usable than non-working binary.
> >
> > So I would really suggest to start reverting non-working firmware files
> > if NXP does not respond in few days.
> >
> > G=C3=A9rald, what is your opinion? Do you see other way how to make main=
line
> > linux driver work (again)?
> >
> > > > > > REF (and all details of tests) :
> > > > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fgithub.com%2FNXP%2Fmwifiex-firmware%2Fissues%2F1&amp;data=3D04%7C01%7Cja=
mes.cao%40nxp.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd=
99c5c301635%7C0%7C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D3=
Y6a7lP%2B%2FXwPWGZARx3c99qV3ZFundY0QtfjmC1mYn4%3D&amp;reserved=3D0
> > > > > >
> > > > > >
> > > > > > Broken firmware :
> > > > > >
> > > > > > Version |W16.68.1.p195| of |pcieusb8997_combo_v4.bin| was includ=
ed into
> > > > > > linux-firmware repository by this pull request:
> > > > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQ=
R9hS4FA%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7C09714=
bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637=
783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi=
LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Dnbzs6YB%2Fyjdp9zJR1PQyZ2pr=
UtPOjthVewIhBCwcqdg%3D&amp;reserved=3D0
> > > > > > <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUi=
QR9hS4FA%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7C0971=
4bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63=
7783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Dnbzs6YB%2Fyjdp9zJR1PQyZ2p=
rUtPOjthVewIhBCwcqdg%3D&amp;reserved=3D0>
> > > > > >
> > > > > > And latest version |W16.68.10.p159| of |pcieusb8997_combo_v4.bin=
| by
> > > > > > this pull request:
> > > > > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i-=
tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cjames.cao%40nxp.=
com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C=
0%7C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D6wktlFLItFxzOdY=
cgTI2Rs9x3PamVJyfWtaNJU0o0bw%3D&amp;reserved=3D0
> > > > > > <https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i=
-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;data=3D04%7C01%7Cjames.cao%40nxp=
.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7=
C0%7C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D6wktlFLItFxzOd=
YcgTI2Rs9x3PamVJyfWtaNJU0o0bw%3D&amp;reserved=3D0>
> > > > > >
> > > > > > Olders looks to works better.
> > > > > >
> > > > > > In quick tests, they allow more than 1 clients at a time !
> > > > > >
> > > > > > I am still testing the V16.68.1.p145 and report the results afte=
r some
> > > > > > longer use...
> > > > > >
> > > > > > Hopes it will help...
> > > > > > Regards,
> > > > > > G=C3=A9rald Kerma
> > > > > > gandalf(at)gk2(dot)net
> > > > >

--Apple-Mail-8456AF67-9E35-481E-8D9E-B7D85D14CE43
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">H=C3=A9llo James,<div><br></div><div>Was it=
 only ever supported ?</div><div><br></div><div>May be NXP can free and shar=
e the firmware source to the community, and let anyone who care try to debug=
 it ?</div><div><br></div><div>As far as my tests shown, the mwifiex driver n=
ever has work correctly, and none version is sufficiently stable to be state=
 as working.</div><div><br></div><div>Please, NXP, take cares of your end cl=
ients !</div><div>Be simple, be smart, be respectuous, give us the source=E2=
=80=A6</div><div><br></div><div>Thanks in advance,</div><div>G=C3=A9rald Ker=
ma<br><br><div dir=3D"ltr">[%]&lt;\@~{</div><div dir=3D"ltr"><br><blockquote=
 type=3D"cite">Le 27 janv. 2022 =C3=A0 00:28, James Cao &lt;james.cao@nxp.co=
m&gt; a =C3=A9crit&nbsp;:<br><br></blockquote></div><blockquote type=3D"cite=
"><div dir=3D"ltr">=EF=BB=BF

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-1=
">



<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
Hi Pali,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
NXP doesn't have a plan to support mwifiex driver anymore. How should we han=
dle this kind of retired project in upstream?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size:=
 12pt; color: rgb(0, 0, 0);">
Thanks,
<div>James</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12pt=
; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" col=
or=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Pali Roh=C3=A1r &lt;pal=
i@kernel.org&gt;<br>
<b>Sent:</b> Thursday, January 20, 2022 11:30 AM<br>
<b>To:</b> Prashanth Ranganathan &lt;prashanthkrishnan.ranganathan@nxp.com&g=
t;<br>
<b>Cc:</b> Sharvari Harisangam &lt;sharvari.harisangam@nxp.com&gt;; Rakesh P=
armar &lt;rakesh.parmar@nxp.com&gt;; Cathy Luo &lt;xiaohua.luo@nxp.com&gt;; J=
ames Cao &lt;james.cao@nxp.com&gt;; Linux Firmware &lt;linux-firmware@kernel=
.org&gt;; Linux Wireless &lt;linux-wireless@vger.kernel.org&gt;;
 G=C3=A9rald Kerma &lt;gandalf@gk2.net&gt;; Ganapathi Bhat &lt;ganapathi017@=
gmail.com&gt;; Josh Boyer &lt;jwboyer@kernel.org&gt;<br>
<b>Subject:</b> [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmwar=
e is buggy</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt">=

<div class=3D"PlainText">Caution: EXT Email<br>
<br>
Hello Prashanth!<br>
<br>
Thank you for reply. Did you have a time to check this issue?<br>
<br>
G=C3=A9rald did a great testing which shows that version W16.68.1.p195 and<b=
r>
higher of pcieuart8997_combo_v4.bin firmware does not work.<br>
<br>
On Friday 14 January 2022 17:11:18 Prashanth Ranganathan wrote:<br>
&gt; Hi Pali,<br>
&gt; Please allow me to check this and respond ASAP.<br>
&gt; Best,<br>
&gt; Prashanth<br>
&gt; ________________________________<br>
&gt; From: Pali Roh=C3=A1r &lt;pali@kernel.org&gt;<br>
&gt; Sent: Friday, January 14, 2022 9:00 AM<br>
&gt; To: Sharvari Harisangam &lt;sharvari.harisangam@nxp.com&gt;; Rakesh Par=
mar &lt;rakesh.parmar@nxp.com&gt;; Cathy Luo &lt;xiaohua.luo@nxp.com&gt;; Pr=
ashanth Ranganathan &lt;prashanthkrishnan.ranganathan@nxp.com&gt;; James Cao=
 &lt;james.cao@nxp.com&gt;<br>
&gt; Cc: Linux Firmware &lt;linux-firmware@kernel.org&gt;; Linux Wireless &l=
t;linux-wireless@vger.kernel.org&gt;; G=C3=A9rald Kerma &lt;gandalf@gk2.net&=
gt;; Ganapathi Bhat &lt;ganapathi017@gmail.com&gt;; Josh Boyer &lt;jwboyer@k=
ernel.org&gt;<br>
&gt; Subject: [EXT] Re: mwifiex 1.0 (16.68.10.p159) - PCIEUSB-8997 firmware i=
s buggy<br>
&gt;<br>
&gt; Caution: EXT Email<br>
&gt;<br>
&gt; NXP people: Sharvari, Rakesh, Cathy, Zheng: could you please look at<br=
>
&gt; this issue? It is really serous!<br>
&gt;<br>
&gt; On Monday 27 September 2021 09:47:23 Josh Boyer wrote:<br>
&gt; &gt; On Sun, Sep 26, 2021 at 6:43 AM Pali Roh=C3=A1r &lt;pali@kernel.or=
g&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hello Josh, Sharvari and other from NXP!<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Saturday 25 September 2021 19:23:48 G=C3=A9rald Kerma wrot=
e:<br>
&gt; &gt; &gt; &gt; Correcting old marvell address to new nxp...<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Le 25/09/2021 =C3=A0 19:19, G=C3=A9rald Kerma a =C3=A9cr=
it :<br>
&gt; &gt; &gt; &gt; &gt; H=C3=A9llo All,<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I made some few tests on EspressoBin-Ultra from Glo=
balScaleTechnologies,<br>
&gt; &gt; &gt; &gt; &gt; because of problem with the WiFi.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I have done some quick tests on all the firmware of=
 PCIEUSB-8997 using<br>
&gt; &gt; &gt; &gt; &gt; the pcieuart8997_combo_v4.bin on OpenWrt 21.02.x<br=
>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Here is a summary of the tests :<br>
&gt; &gt; &gt; &gt; &gt; - W16.68.10.p159 =3D KO<br>
&gt; &gt; &gt; &gt; &gt; - W16.68.1.p195 =3D KO<br>
&gt; &gt; &gt; &gt; &gt; - V16.68.1.p145 =3D OK<br>
&gt; &gt; &gt; &gt; &gt; - 16.68.1.p140 =3D OK<br>
&gt; &gt; &gt; &gt; &gt; - 16.68.1.p133 =3D OK<br>
&gt; &gt; &gt; &gt; &gt; - 16.68.1.p97 =3D OK<br>
&gt; &gt; &gt; &gt; &gt; - 16.68.1.p70 =3D KO<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =46rom this user test result can be seen that last two versio=
ns of<br>
&gt; &gt; &gt; pcieusb8997_combo_v4.bin firmware file for 8997 wifi+bt card w=
ith<br>
&gt; &gt; &gt; official mainline linux kernel driver mwifiex were not proper=
ly tested<br>
&gt; &gt; &gt; internally in NXP and are causing serious issues which make 8=
997 card<br>
&gt; &gt; &gt; basically unusable.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Sharvari and other NXP developers: Do you have some internal t=
esting of<br>
&gt; &gt; &gt; this pcieusb8997_combo_v4.bin firmware for PCIe+USB variant o=
f 8997<br>
&gt; &gt; &gt; wifi chips? Or are you aware of this issue and do you have in=
 NXP some<br>
&gt; &gt; &gt; workaround for it (e.g. at driver level)? Could you please lo=
ok at this<br>
&gt; &gt; &gt; serious issue and try to debug firmware and release a new ver=
sion, as<br>
&gt; &gt; &gt; this is obvious fatal error in firmware itself?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Josh, how you in linux-firmware repository handle such, I mus=
t say,<br>
&gt; &gt; &gt; "fatal issues"? Wait for vendor fixes or revert problematic c=
ommits? Or<br>
&gt; &gt; &gt; something else?<br>
&gt; &gt;<br>
&gt; &gt; We can revert if we need to, but I think it's not quite that simpl=
e.<br>
&gt; &gt;<br>
&gt; &gt; &gt; Because when users starts upgrading linux-firmware packages i=
n their<br>
&gt; &gt; &gt; downstream distributions then basically wifi cards on this 89=
97 chips<br>
&gt; &gt; &gt; with official mwifiex driver stops working.<br>
&gt; &gt;<br>
&gt; &gt; The first broken version was committed in Feb of 2019.&nbsp; That'=
s<br>
&gt; &gt; approaching 3 years ago.&nbsp; Given that this is binary firmware,=
 I have<br>
&gt; &gt; no idea what else may or may not be included in the updates in the=
<br>
&gt; &gt; meantime.<br>
&gt; &gt;<br>
&gt; &gt; josh<br>
&gt;<br>
&gt; Josh, as G=C3=A9rald wrote, current binary in linux-firmware repository=
 is<br>
&gt; unusable. And there is no reply from NXP for 3 months.<br>
&gt;<br>
&gt; You are right that nobody knows what is in firmware binary, but working=
<br>
&gt; binary is at least usable than non-working binary.<br>
&gt;<br>
&gt; So I would really suggest to start reverting non-working firmware files=
<br>
&gt; if NXP does not respond in few days.<br>
&gt;<br>
&gt; G=C3=A9rald, what is your opinion? Do you see other way how to make mai=
nline<br>
&gt; linux driver work (again)?<br>
&gt;<br>
&gt; &gt; &gt; &gt; &gt; REF (and all details of tests) :<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://eur01.safelinks.protection.outlo=
ok.com/?url=3Dhttps%3A%2F%2Fgithub.com%2FNXP%2Fmwifiex-firmware%2Fissues%2F1=
&amp;amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7C09714bf302224e66a34c08d9dc4b=
5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637783038495772224%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C3000&amp;amp;sdata=3D3Y6a7lP%2B%2FXwPWGZARx3c99qV3ZFundY0QtfjmC1mY=
n4%3D&amp;amp;reserved=3D0">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.c=
om%2FNXP%2Fmwifiex-firmware%2Fissues%2F1&amp;amp;data=3D04%7C01%7Cjames.cao%=
40nxp.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301=
635%7C0%7C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3D3Y6a7=
lP%2B%2FXwPWGZARx3c99qV3ZFundY0QtfjmC1mYn4%3D&amp;amp;reserved=3D0</a><br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Broken firmware :<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Version |W16.68.1.p195| of |pcieusb8997_combo_v4.bi=
n| was included into<br>
&gt; &gt; &gt; &gt; &gt; linux-firmware repository by this pull request:<br>=

&gt; &gt; &gt; &gt; &gt; <a href=3D"https://eur01.safelinks.protection.outlo=
ok.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F812=
0B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40mail.gmail.com%2F&amp;amp;data=3D04%7C01%7=
Cjames.cao%40nxp.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa9=
2cd99c5c301635%7C0%7C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sd=
ata=3Dnbzs6YB%2Fyjdp9zJR1PQyZ2prUtPOjthVewIhBCwcqdg%3D&amp;amp;reserved=3D0"=
>
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.ker=
nel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40ma=
il.gmail.com%2F&amp;amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7C09714bf302224=
e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63778303849=
5772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3Dnbzs6YB%2Fyjdp9zJR1PQyZ2prUtPO=
jthVewIhBCwcqdg%3D&amp;amp;reserved=3D0</a><br>
&gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"https://eur01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7=
F8120B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%40mail.gmail.com%2F&amp;amp;data=3D04%7C=
01%7Cjames.cao%40nxp.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c=
6fa92cd99c5c301635%7C0%7C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;am=
p;sdata=3Dnbzs6YB%2Fyjdp9zJR1PQyZ2prUtPOjthVewIhBCwcqdg%3D&amp;amp;reserved=3D=
0">https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
kernel.org%2Fall%2FCA%2B5PVA5yQbjg3vaT7F8120B6ngLn7%2BsZC0OWt0KoUiQR9hS4FA%4=
0mail.gmail.com%2F&amp;amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7C09714bf302=
224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C63778303=
8495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT=
iI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3Dnbzs6YB%2Fyjdp9zJR1PQyZ2prU=
tPOjthVewIhBCwcqdg%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; And latest version |W16.68.10.p159| of |pcieusb8997=
_combo_v4.bin| by<br>
&gt; &gt; &gt; &gt; &gt; this pull request:<br>
&gt; &gt; &gt; &gt; &gt; <a href=3D"https://eur01.safelinks.protection.outlo=
ok.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7=
%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;amp;data=3D=
04%7C01%7Cjames.cao%40nxp.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3b=
c2b4c6fa92cd99c5c301635%7C0%7C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&a=
mp;amp;sdata=3D6wktlFLItFxzOdYcgTI2Rs9x3PamVJyfWtaNJU0o0bw%3D&amp;amp;reserv=
ed=3D0">
https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.ker=
nel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-AmM=
B-Jrtg%40mail.gmail.com%2F&amp;amp;data=3D04%7C01%7Cjames.cao%40nxp.com%7C09=
714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C=
637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3D6wktlFLItFxzOdYcgTI=
2Rs9x3PamVJyfWtaNJU0o0bw%3D&amp;amp;reserved=3D0</a><br>
&gt; &gt; &gt; &gt; &gt; &lt;<a href=3D"https://eur01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA=
5on7%2BCRtEV7tThPxgucwt3W9i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;amp;d=
ata=3D04%7C01%7Cjames.cao%40nxp.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686=
ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637783038495772224%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000&amp;amp;sdata=3D6wktlFLItFxzOdYcgTI2Rs9x3PamVJyfWtaNJU0o0bw%3D&amp;amp;=
reserved=3D0">https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Flore.kernel.org%2Flinux-firmware%2FCA%2B5PVA5on7%2BCRtEV7tThPxgucwt3W9=
i-tEXm4cgH-AmMB-Jrtg%40mail.gmail.com%2F&amp;amp;data=3D04%7C01%7Cjames.cao%=
40nxp.com%7C09714bf302224e66a34c08d9dc4b5bb5%7C686ea1d3bc2b4c6fa92cd99c5c301=
635%7C0%7C0%7C637783038495772224%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sdata=3D6wktl=
FLItFxzOdYcgTI2Rs9x3PamVJyfWtaNJU0o0bw%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Olders looks to works better.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; In quick tests, they allow more than 1 clients at a=
 time !<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; I am still testing the V16.68.1.p145 and report the=
 results after some<br>
&gt; &gt; &gt; &gt; &gt; longer use...<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Hopes it will help...<br>
&gt; &gt; &gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; &gt; &gt; G=C3=A9rald Kerma<br>
&gt; &gt; &gt; &gt; &gt; gandalf(at)gk2(dot)net<br>
&gt; &gt; &gt; &gt;<br>
</div>
</span></font></div>


</div></blockquote></div></body></html>=

--Apple-Mail-8456AF67-9E35-481E-8D9E-B7D85D14CE43--
