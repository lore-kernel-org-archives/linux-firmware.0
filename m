Return-Path: <SRS0=II4c=IS=gmail.com=clamor95@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E74C3DA6E
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Jan 2024 19:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A332C433CB; Mon,  8 Jan 2024 19:11:02 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB5F4C433C9
	for <linux-firmware@kernel.org>; Mon,  8 Jan 2024 19:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB5F4C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3374eb61cbcso2178923f8f.0
        for <linux-firmware@kernel.org>; Mon, 08 Jan 2024 11:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704741059; x=1705345859; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=prlQOGq1ZXjwVPgjH7hzY5JPbX0TYuh4PdpcbBYhYgE=;
        b=c81IWi7zKmXjKCuvrL6jJYVnnGLg6SHYcUelqM4cQPPtkpHZrr9JF59WkFFd/i9sSS
         isEbq1EPZd+FGb0QG8gvVlpMhlCYkDx8BZi42XFY4sVgYy0gEHuQkGpE8Mb2y/ChbrjM
         3FlwMh0o9i1DaGEkBaTZhJq88m+Yf62HLgxtN83t0eBxntaXaLDGflf440SytvWEbvES
         Qwh/DhCrIGxgJ/D9bwe0ujokypacMA+dRgIGOuCLfqGxRjDZTisA1dpbYYS+1M13aygQ
         gR+Zy5uUbSWwM/lpf2ttvBnj7C6TlVeEmKZtugTQrCMYIzNk1LRnus3e2Y3XTCmnRkiM
         60wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704741059; x=1705345859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prlQOGq1ZXjwVPgjH7hzY5JPbX0TYuh4PdpcbBYhYgE=;
        b=AoJG/spfA9RkNr5tI7jSJifd0DucZmdEC7VN+jAo+7ji4GxtXIrZwDQdmGqCXRg+IK
         w3w8vMnschS+J+SmJvtEPYd4NSQURoGe3W7DD+yXTR9WuoyM9dR0DJ/Pz2cPDgM6Nf52
         /T+732JJr+fB+m1BmcTvbMRtTX3T4DvUK9oSSBws3z4gD6bzpUAFIAdBrahQlGP/XAuq
         dYOTi+aKJeI4o1aVg8oV58xO2SY7T+Iawh1tUgaDTPd6M/JFSAFCIzxFygOUH+NKha7i
         vo4bHfJzeTfJp7Ol2+uxcEF+7BTYAlRi0etMJgoV9x709Kf5jPFOuHUJtEKIGBmkNXkV
         auWw==
X-Gm-Message-State: AOJu0Yx0AsMS9Rfyy5hpwt5gxCxeWHSiPgY/tZY6aheYW34zHTlOpI2U
	k4cjy50I+/DtMwFQrXvDu99smS7yqgOkW8afbPc=
X-Google-Smtp-Source: AGHT+IGaAvOAoe6HDztHeNK09ZkdMKTO92Ras3WmXymRBEk9oNx9TC8h3nrszlRCEvhvNeupn0MtZ8MLhD1brJ8XVD4=
X-Received: by 2002:a5d:5302:0:b0:336:95d2:c64a with SMTP id
 e2-20020a5d5302000000b0033695d2c64amr2169006wrv.130.1704741058973; Mon, 08
 Jan 2024 11:10:58 -0800 (PST)
MIME-Version: 1.0
References: <CAPVz0n2Ky350xhOv6WvE0YhFJ9QBe59LnWvKiafs2tjFnptP+g@mail.gmail.com>
 <22115037-3a81-4a52-8e64-bc85c2be4212@broadcom.com> <CAPVz0n2Dah1b45c0yUjMZNph5AVJjneLsc2LOQ-dkXNRTv6y+Q@mail.gmail.com>
 <18cce9a7818.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <18ccea1d6d0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <BFE6B9E5-CAF5-4E30-A4A2-A2489423C961@gmail.com> <18cd08e83d0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAPVz0n347PVv28H2wswmO3N63dpfPZ0d3VrdxmQHXMoo9LS69g@mail.gmail.com>
 <18ce9be5470.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAPVz0n3BxJjaudDnC=QLHa-0NsE9JSs1ezFpwK2yb=9ySyr2cw@mail.gmail.com>
 <18cea3af2c8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAPVz0n3-nirqD9XW+-R_Uh8Ehkm2WKcxa3ZTp8TiOUf7gz+wKA@mail.gmail.com> <a1a3683b-9d47-41e8-a527-17bdca1607ba@gmail.com>
In-Reply-To: <a1a3683b-9d47-41e8-a527-17bdca1607ba@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 8 Jan 2024 21:10:49 +0200
Message-ID: <CAPVz0n22borWH-QSXyWXyQaXxDJeeb+PDJwf2nArBjGM7DkEFA@mail.gmail.com>
Subject: Re: License of old broadcom BT firmwares and WiFi calibration files
To: Arend Van Spriel <aspriel@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Arend Van Spriel <arend.vanspriel@broadcom.com>, linux-wireless@vger.kernel.org, 
	linux-firmware@kernel.org, linux-bluetooth@vger.kernel.org, 
	Marcel Holtmann <marcel@holtmann.org>
Content-Type: multipart/alternative; boundary="0000000000004118f3060e73f56a"

--0000000000004118f3060e73f56a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 8 =D1=81=D1=96=D1=87. 2024=E2=80=AF=D1=80., 9:03=E2=80=AF=D0=
=BF=D0=BF =D0=BA=D0=BE=D1=80=D0=B8=D1=81=D1=82=D1=83=D0=B2=D0=B0=D1=87 Aren=
d Van Spriel <aspriel@gmail.com>
=D0=BF=D0=B8=D1=88=D0=B5:

> + linux-bluetooth
> + Marcel
>
> On 1/8/2024 7:21 PM, Svyatoslav Ryhel wrote:
> > =D0=BF=D0=BD, 8 =D1=81=D1=96=D1=87. 2024=E2=80=AF=D1=80. =D0=BE 19:59 A=
rend Van Spriel <
> arend.vanspriel@broadcom.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On January 8, 2024 5:48:37 PM Svyatoslav Ryhel <clamor95@gmail.com>
> wrote:
> >>
> >>> =D0=BF=D0=BD, 8 =D1=81=D1=96=D1=87. 2024=E2=80=AF=D1=80. =D0=BE 17:43=
 Arend Van Spriel <
> arend.vanspriel@broadcom.com>
> >>> =D0=BF=D0=B8=D1=88=D0=B5:
> >>>>
> >>>> On January 4, 2024 10:08:04 AM Svyatoslav Ryhel <clamor95@gmail.com>
> wrote:
> >>>>
> >>>>> =D1=81=D1=80, 3 =D1=81=D1=96=D1=87. 2024=E2=80=AF=D1=80. =D0=BE 20:=
20 Arend Van Spriel <
> arend.vanspriel@broadcom.com>
> >>>>> =D0=BF=D0=B8=D1=88=D0=B5:
> >>>>>>
> >>>>>> On January 3, 2024 6:28:33 PM Svyatoslav Ryhel <clamor95@gmail.com=
>
> wrote:
> >>>>>>
> >>>>>>> 3 =D1=81=D1=96=D1=87=D0=BD=D1=8F 2024 =D1=80. 11:22:42 GMT+02:00,=
 Arend Van Spriel
> >>>>>>> <arend.vanspriel@broadcom.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=
=B0=D0=B2(-=D0=BB=D0=B0):
> >>>>>>>> On January 3, 2024 10:14:42 AM Arend Van Spriel
> >>>>>>>> <arend.vanspriel@broadcom.com> wrote:
> >>>>>>>>
> >>>>>>>>> + linux-wireless
> >>>>>>>>> + Hans de Goede
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> On December 16, 2023 9:14:48 PM Svyatoslav Ryhel <
> clamor95@gmail.com> wrote:
> >>>>>>>>>
> >>>>>>>>>> =D1=81=D0=B1, 16 =D0=B3=D1=80=D1=83=D0=B4. 2023=E2=80=AF=D1=80=
. =D0=BE 21:57 Arend van Spriel
> >>>>>>>>>> <arend.vanspriel@broadcom.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >>>>>>>>>>>
> >>>>>>>>>>> On 12/16/2023 6:45 PM, Svyatoslav Ryhel wrote:
> >>>>>>>>>>>> Greetings!
> >>>>>>>>>>>>
> >>>>>>>>>>>> I am trying to submit bluetooth firmwares (BCM4329B1.*,*.hcd
> and
> >>>>>>>>>>>> BCM4330B1.*,*.hcd) and wifi calibration files
> >>>>>>>>>>>> (brcmfmac4329-sdio.*,*.txt and brcmfmac4329-sdio.*,*.txt)
> from a few
> >>>>>>>>>>>> Tegra 2 and Tegra 3 based devices into linux-fimware.
> >>>>>>>>>>>>
> >>>>>>>>>>>> I have faced ambiguous license issue since those files were
> part of
> >>>>>>>>>>>> Android Images of different vendors. Those vendors did not
> provide a
> >>>>>>>>>>>> license nor for android images, not for these files.
> >>>>>>>>
> >>>>>>>> Does this mean you extracted them from the android image? That
> probably
> >>>>>>>> never get accepted without any license information.
> >>>>>>>
> >>>>>>> Can Broadcom re-grant license to these files?
> >>>>>>>
> >>>>>>> This license is for bcm4329 in crespo
> >>>>>>> <
> https://android.googlesource.com/device/samsung/crespo/+/refs/heads/main/=
self-extractors/broadcom/LICENSE
> >
> >>>>>>
> >>>>>> Actually checked this link:
> >>>>>>
> >>>>>>
> https://android.googlesource.com/device/samsung/crespo/+/refs/heads/main/=
proprietary-blobs.txt
> >>>>>>
> >>>>>> It lists the bcm4329.hcd file as falling under Apache-2.0 license.
> Same for
> >>>>>> asus/grouper.
> >>>>>>
> >>>>>> Regards,
> >>>>>> Arend
> >>>>>
> >>>>> So this actually resolves ambiguity. Thanks
> >>>>
> >>>> Yes, but ... you should add them to linux-firmware under the same
> license.
> >>>> That means you need to mark them as such in the WHENCE file. Feel
> free to
> >>>> cc: me for the patch so I can have a look at it.
> >>>>
> >>>> Regards,
> >>>> Arend
> >>>
> >>> Thank you for your assistance, it is really appreciated and valued bu=
t
> >>> it was rejected
> >>>
> >>> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/11=
4
> >>>
> >>> I have referred to our conversation.
> >>
> >> I see and it seems they were correct. My bad. Clearly should not try a
> >> career as lawyer.
> >>
> >> I can try to publish them to linux-firmware, but I have to ask
> internally.
> >>
> >> Regards,
> >> Arend
> >>
> >
> > Thank you, looking forward to your answer. But keep in mind that
> > generic firmware for bluetooth might not be an option. I have tried to
> > shuffle them and bluetooth failed.
>
> Okay. I guess there is a naming scheme that btbcm.ko uses. Will look in
> the source file how it loads firmware/patch. Actually your merge request
> would also tell me. That involves a whole lot more firmware files than
> what we discussed earlier.
>
> Regards,
> Arend
>

Uh, yes, I am terribly sorry about that. I was looking for analogies with
existing publishes of firmwares since bt firmware occured to be not
interchangeable. I have no hopes that any of them will be accepted, so if
any passes then good.

>

--0000000000004118f3060e73f56a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">=D0=BF=D0=BD, 8 =D1=81=D1=96=D1=87. 2024=E2=80=AF=D1=80., 9:03=
=E2=80=AF=D0=BF=D0=BF =D0=BA=D0=BE=D1=80=D0=B8=D1=81=D1=82=D1=83=D0=B2=D0=
=B0=D1=87 Arend Van Spriel &lt;<a href=3D"mailto:aspriel@gmail.com">aspriel=
@gmail.com</a>&gt; =D0=BF=D0=B8=D1=88=D0=B5:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">+ linux-bluetooth<br>
+ Marcel<br>
<br>
On 1/8/2024 7:21 PM, Svyatoslav Ryhel wrote:<br>
&gt; =D0=BF=D0=BD, 8 =D1=81=D1=96=D1=87. 2024=E2=80=AF=D1=80. =D0=BE 19:59 =
Arend Van Spriel &lt;<a href=3D"mailto:arend.vanspriel@broadcom.com" target=
=3D"_blank" rel=3D"noreferrer">arend.vanspriel@broadcom.com</a>&gt; =D0=BF=
=D0=B8=D1=88=D0=B5:<br>
&gt;&gt;<br>
&gt;&gt; On January 8, 2024 5:48:37 PM Svyatoslav Ryhel &lt;<a href=3D"mail=
to:clamor95@gmail.com" target=3D"_blank" rel=3D"noreferrer">clamor95@gmail.=
com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; =D0=BF=D0=BD, 8 =D1=81=D1=96=D1=87. 2024=E2=80=AF=D1=80. =D0=
=BE 17:43 Arend Van Spriel &lt;<a href=3D"mailto:arend.vanspriel@broadcom.c=
om" target=3D"_blank" rel=3D"noreferrer">arend.vanspriel@broadcom.com</a>&g=
t;<br>
&gt;&gt;&gt; =D0=BF=D0=B8=D1=88=D0=B5:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On January 4, 2024 10:08:04 AM Svyatoslav Ryhel &lt;<a hre=
f=3D"mailto:clamor95@gmail.com" target=3D"_blank" rel=3D"noreferrer">clamor=
95@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; =D1=81=D1=80, 3 =D1=81=D1=96=D1=87. 2024=E2=80=AF=D1=
=80. =D0=BE 20:20 Arend Van Spriel &lt;<a href=3D"mailto:arend.vanspriel@br=
oadcom.com" target=3D"_blank" rel=3D"noreferrer">arend.vanspriel@broadcom.c=
om</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt; =D0=BF=D0=B8=D1=88=D0=B5:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On January 3, 2024 6:28:33 PM Svyatoslav Ryhel &lt=
;<a href=3D"mailto:clamor95@gmail.com" target=3D"_blank" rel=3D"noreferrer"=
>clamor95@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; 3 =D1=81=D1=96=D1=87=D0=BD=D1=8F 2024 =D1=80. =
11:22:42 GMT+02:00, Arend Van Spriel<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:arend.vanspriel@broadcom=
.com" target=3D"_blank" rel=3D"noreferrer">arend.vanspriel@broadcom.com</a>=
&gt; =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=B2(-=D0=BB=D0=B0):<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On January 3, 2024 10:14:42 AM Arend Van S=
priel<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:arend.vanspriel@broa=
dcom.com" target=3D"_blank" rel=3D"noreferrer">arend.vanspriel@broadcom.com=
</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + linux-wireless<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; + Hans de Goede<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On December 16, 2023 9:14:48 PM Svyato=
slav Ryhel &lt;<a href=3D"mailto:clamor95@gmail.com" target=3D"_blank" rel=
=3D"noreferrer">clamor95@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; =D1=81=D0=B1, 16 =D0=B3=D1=80=D1=
=83=D0=B4. 2023=E2=80=AF=D1=80. =D0=BE 21:57 Arend van Spriel<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:arend.vanspr=
iel@broadcom.com" target=3D"_blank" rel=3D"noreferrer">arend.vanspriel@broa=
dcom.com</a>&gt; =D0=BF=D0=B8=D1=88=D0=B5:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On 12/16/2023 6:45 PM, Svyatos=
lav Ryhel wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Greetings!<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I am trying to submit blue=
tooth firmwares (BCM4329B1.*,*.hcd and<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; BCM4330B1.*,*.hcd) and wif=
i calibration files<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; (brcmfmac4329-sdio.*,*.txt=
 and brcmfmac4329-sdio.*,*.txt) from a few<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Tegra 2 and Tegra 3 based =
devices into linux-fimware.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I have faced ambiguous lic=
ense issue since those files were part of<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Android Images of differen=
t vendors. Those vendors did not provide a<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; license nor for android im=
ages, not for these files.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Does this mean you extracted them from the=
 android image? That probably<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; never get accepted without any license inf=
ormation.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Can Broadcom re-grant license to these files?<=
br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; This license is for bcm4329 in crespo<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"https://android.googlesource.co=
m/device/samsung/crespo/+/refs/heads/main/self-extractors/broadcom/LICENSE"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://android.googlesour=
ce.com/device/samsung/crespo/+/refs/heads/main/self-extractors/broadcom/LIC=
ENSE</a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Actually checked this link:<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://android.googlesource.com/device=
/samsung/crespo/+/refs/heads/main/proprietary-blobs.txt" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://android.googlesource.com/device/samsu=
ng/crespo/+/refs/heads/main/proprietary-blobs.txt</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; It lists the bcm4329.hcd file as falling under Apa=
che-2.0 license. Same for<br>
&gt;&gt;&gt;&gt;&gt;&gt; asus/grouper.<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt;&gt;&gt; Arend<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; So this actually resolves ambiguity. Thanks<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Yes, but ... you should add them to linux-firmware under t=
he same license.<br>
&gt;&gt;&gt;&gt; That means you need to mark them as such in the WHENCE fil=
e. Feel free to<br>
&gt;&gt;&gt;&gt; cc: me for the patch so I can have a look at it.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Regards,<br>
&gt;&gt;&gt;&gt; Arend<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thank you for your assistance, it is really appreciated and va=
lued but<br>
&gt;&gt;&gt; it was rejected<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://gitlab.com/kernel-firmware/linux-firmware/-=
/merge_requests/114" rel=3D"noreferrer noreferrer" target=3D"_blank">https:=
//gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/114</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I have referred to our conversation.<br>
&gt;&gt;<br>
&gt;&gt; I see and it seems they were correct. My bad. Clearly should not t=
ry a<br>
&gt;&gt; career as lawyer.<br>
&gt;&gt;<br>
&gt;&gt; I can try to publish them to linux-firmware, but I have to ask int=
ernally.<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Arend<br>
&gt;&gt;<br>
&gt; <br>
&gt; Thank you, looking forward to your answer. But keep in mind that<br>
&gt; generic firmware for bluetooth might not be an option. I have tried to=
<br>
&gt; shuffle them and bluetooth failed.<br>
<br>
Okay. I guess there is a naming scheme that btbcm.ko uses. Will look in <br=
>
the source file how it loads firmware/patch. Actually your merge request <b=
r>
would also tell me. That involves a whole lot more firmware files than <br>
what we discussed earlier.<br>
<br>
Regards,<br>
Arend<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Uh, yes, I am terribly sorry about that. I was looking for analogies w=
ith existing publishes of firmwares since bt firmware occured to be not int=
erchangeable. I have no hopes that any of them will be accepted, so if any =
passes then good.</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000004118f3060e73f56a--
