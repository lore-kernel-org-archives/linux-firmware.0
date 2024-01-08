Return-Path: <SRS0=II4c=IS=gmail.com=clamor95@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED56C3DA6E
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Jan 2024 18:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE004C433C9; Mon,  8 Jan 2024 18:21:33 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D21FCC433C8
	for <linux-firmware@kernel.org>; Mon,  8 Jan 2024 18:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D21FCC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-336dcebcdb9so2309513f8f.1
        for <linux-firmware@kernel.org>; Mon, 08 Jan 2024 10:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704738091; x=1705342891; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oh00BWPDA3TEwCHwjUiWs+woCjiFdSbxvzeNpEaiT/Y=;
        b=UJLDn1ZtxlKcKkbW+Xtp+YxalqpPWKimsWthkDRtZz2/13md/3UNUE3Tj0KbcRZUnC
         ape/k+K9tT2iTuUvqwEA2OheMd8LhM8kAshOw3DSlvvx4jCCinG+vrrK2rEFolqGDFS7
         bfrFWytOWCT3DPUeGJvUoDlZVx2GTJ48i8nxFApmUB7lGKsu6x1Up6IdFJqH2LYOVbGl
         gI3dy4o6HeA/h7xBulsgJmOBvKKMSu8dDDhZYxF3GZRZGyYXZo7bjoUuTBGK/IBI4fOY
         N2JkdToS7yuD3dY+3Pt4nI9QspoNJo1r9jjLLUKJYBvzT2JtTIiZPzPwtD5ydaTLsTzU
         TXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704738091; x=1705342891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oh00BWPDA3TEwCHwjUiWs+woCjiFdSbxvzeNpEaiT/Y=;
        b=PY9oDra2ybcSmdRNwBhlj/5r1rd1Q8u9Cf6Ci47R720GNbhjKfcK2jzfr4Lj/XRknS
         b5/2Yr6czT6wUYyocbBgAZkr2E66sC6uIpyB3DQTcTkl5d31ss6P5Q/KKvxoJdlf2lfn
         fuSQKamzf9FmF5JVTqeXr75E/FoDeaUIODSOhOGgitA1OfqhI9hGWJSi68QKvJDSqF23
         iR0V646UoALGmgjeceXoSOKfmCXUAvvpaOjlafRrSLhTQ91vVTHr6Sz6X2N9qXAhVu6a
         X1a1U4ZzNAjTr8hPl+5rGHA12+IScCLqZUjg3iLehC2vgppfyLmvMzPKGjgWx/qsZy2Y
         a9gg==
X-Gm-Message-State: AOJu0YzCsJRRVYZvxs3db1jwuMzNGNSBFn9+o09ZPu/oSYEQNmBE0c8b
	tlMZEdjiK4m+SCdP7RTicfKA8OuV3GVw1/+GJwE=
X-Google-Smtp-Source: AGHT+IFMc5sSolGG94JasR0VkKxFaTccBO4+BdnRvmjhdhiuHD3WRFK2jRWFLlhyx9bYYP/8DXqoj3hNthwY8k+8rCU=
X-Received: by 2002:a5d:6606:0:b0:336:c434:5c20 with SMTP id
 n6-20020a5d6606000000b00336c4345c20mr1216259wru.149.1704738090826; Mon, 08
 Jan 2024 10:21:30 -0800 (PST)
MIME-Version: 1.0
References: <CAPVz0n2Ky350xhOv6WvE0YhFJ9QBe59LnWvKiafs2tjFnptP+g@mail.gmail.com>
 <22115037-3a81-4a52-8e64-bc85c2be4212@broadcom.com> <CAPVz0n2Dah1b45c0yUjMZNph5AVJjneLsc2LOQ-dkXNRTv6y+Q@mail.gmail.com>
 <18cce9a7818.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <18ccea1d6d0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <BFE6B9E5-CAF5-4E30-A4A2-A2489423C961@gmail.com> <18cd08e83d0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAPVz0n347PVv28H2wswmO3N63dpfPZ0d3VrdxmQHXMoo9LS69g@mail.gmail.com>
 <18ce9be5470.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAPVz0n3BxJjaudDnC=QLHa-0NsE9JSs1ezFpwK2yb=9ySyr2cw@mail.gmail.com> <18cea3af2c8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <18cea3af2c8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 8 Jan 2024 20:21:19 +0200
Message-ID: <CAPVz0n3-nirqD9XW+-R_Uh8Ehkm2WKcxa3ZTp8TiOUf7gz+wKA@mail.gmail.com>
Subject: Re: License of old broadcom BT firmwares and WiFi calibration files
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 8 =D1=81=D1=96=D1=87. 2024=E2=80=AF=D1=80. =D0=BE 19:59 Arend=
 Van Spriel <arend.vanspriel@broadcom.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On January 8, 2024 5:48:37 PM Svyatoslav Ryhel <clamor95@gmail.com> wrote=
:
>
> > =D0=BF=D0=BD, 8 =D1=81=D1=96=D1=87. 2024=E2=80=AF=D1=80. =D0=BE 17:43 A=
rend Van Spriel <arend.vanspriel@broadcom.com>
> > =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On January 4, 2024 10:08:04 AM Svyatoslav Ryhel <clamor95@gmail.com> w=
rote:
> >>
> >>> =D1=81=D1=80, 3 =D1=81=D1=96=D1=87. 2024=E2=80=AF=D1=80. =D0=BE 20:20=
 Arend Van Spriel <arend.vanspriel@broadcom.com>
> >>> =D0=BF=D0=B8=D1=88=D0=B5:
> >>>>
> >>>> On January 3, 2024 6:28:33 PM Svyatoslav Ryhel <clamor95@gmail.com> =
wrote:
> >>>>
> >>>>> 3 =D1=81=D1=96=D1=87=D0=BD=D1=8F 2024 =D1=80. 11:22:42 GMT+02:00, A=
rend Van Spriel
> >>>>> <arend.vanspriel@broadcom.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=
=D0=B2(-=D0=BB=D0=B0):
> >>>>>> On January 3, 2024 10:14:42 AM Arend Van Spriel
> >>>>>> <arend.vanspriel@broadcom.com> wrote:
> >>>>>>
> >>>>>>> + linux-wireless
> >>>>>>> + Hans de Goede
> >>>>>>>
> >>>>>>>
> >>>>>>> On December 16, 2023 9:14:48 PM Svyatoslav Ryhel <clamor95@gmail.=
com> wrote:
> >>>>>>>
> >>>>>>>> =D1=81=D0=B1, 16 =D0=B3=D1=80=D1=83=D0=B4. 2023=E2=80=AF=D1=80. =
=D0=BE 21:57 Arend van Spriel
> >>>>>>>> <arend.vanspriel@broadcom.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >>>>>>>>>
> >>>>>>>>> On 12/16/2023 6:45 PM, Svyatoslav Ryhel wrote:
> >>>>>>>>>> Greetings!
> >>>>>>>>>>
> >>>>>>>>>> I am trying to submit bluetooth firmwares (BCM4329B1.*,*.hcd a=
nd
> >>>>>>>>>> BCM4330B1.*,*.hcd) and wifi calibration files
> >>>>>>>>>> (brcmfmac4329-sdio.*,*.txt and brcmfmac4329-sdio.*,*.txt) from=
 a few
> >>>>>>>>>> Tegra 2 and Tegra 3 based devices into linux-fimware.
> >>>>>>>>>>
> >>>>>>>>>> I have faced ambiguous license issue since those files were pa=
rt of
> >>>>>>>>>> Android Images of different vendors. Those vendors did not pro=
vide a
> >>>>>>>>>> license nor for android images, not for these files.
> >>>>>>
> >>>>>> Does this mean you extracted them from the android image? That pro=
bably
> >>>>>> never get accepted without any license information.
> >>>>>
> >>>>> Can Broadcom re-grant license to these files?
> >>>>>
> >>>>> This license is for bcm4329 in crespo
> >>>>> <https://android.googlesource.com/device/samsung/crespo/+/refs/head=
s/main/self-extractors/broadcom/LICENSE>
> >>>>
> >>>> Actually checked this link:
> >>>>
> >>>> https://android.googlesource.com/device/samsung/crespo/+/refs/heads/=
main/proprietary-blobs.txt
> >>>>
> >>>> It lists the bcm4329.hcd file as falling under Apache-2.0 license. S=
ame for
> >>>> asus/grouper.
> >>>>
> >>>> Regards,
> >>>> Arend
> >>>
> >>> So this actually resolves ambiguity. Thanks
> >>
> >> Yes, but ... you should add them to linux-firmware under the same lice=
nse.
> >> That means you need to mark them as such in the WHENCE file. Feel free=
 to
> >> cc: me for the patch so I can have a look at it.
> >>
> >> Regards,
> >> Arend
> >
> > Thank you for your assistance, it is really appreciated and valued but
> > it was rejected
> >
> > https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/114
> >
> > I have referred to our conversation.
>
> I see and it seems they were correct. My bad. Clearly should not try a
> career as lawyer.
>
> I can try to publish them to linux-firmware, but I have to ask internally=
.
>
> Regards,
> Arend
>

Thank you, looking forward to your answer. But keep in mind that
generic firmware for bluetooth might not be an option. I have tried to
shuffle them and bluetooth failed.

Best regards,
Svyatoslav R.
