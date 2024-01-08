Return-Path: <SRS0=II4c=IS=gmail.com=clamor95@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5156C3DA6E
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Jan 2024 16:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DB6DC433C7; Mon,  8 Jan 2024 16:48:39 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9855BC433CA
	for <linux-firmware@kernel.org>; Mon,  8 Jan 2024 16:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9855BC433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3368d1c7b23so2026665f8f.0
        for <linux-firmware@kernel.org>; Mon, 08 Jan 2024 08:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704732517; x=1705337317; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDbtiLbA1iRT2Xe0QDhUmpbL4hjpDHQ12hK+fzVUvx8=;
        b=gTOYKOYNGpj2kx8bOnEoPQin96R4OMhh8Dmu5zTq+2qsPoq0ffwfviIhFzsZAuajiZ
         bH/ctTMEZHcGpvxpyeVi+RTme6agFitezFO0cIw8aAjaYwHjYM7KPeHUB20+AWbMm8YL
         ijAC/xLosDvQEbtEcTbFvlL1SJtl2Rta3KYWDUJjg+VXkU2iuOCzY7YUm+jqiJYhRrr4
         cZHw/9XQ/RYrQzv0h6LpZ9QwMIvYi7rPEQEggdKoad3pKgsUm2xfDsvkRxMNlQf5MXqO
         wIbHE8u/0LCWtVDV3k8siNL/OIHn9ZgpERx+vCTuslHH70DDgERoUBOCBcV9YmJDqBUF
         vBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704732517; x=1705337317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDbtiLbA1iRT2Xe0QDhUmpbL4hjpDHQ12hK+fzVUvx8=;
        b=Ygc4Fq29XsZ0cbhwQ7jnAAnrShdrTQGTrl2kqlfTqOcg+E2TgGa4eN2Bfm4T9pMGsO
         QeFnfrD+8QiqKHbcpcZGxwmDkpyp/zqKp24L8lE+ph8YvxOaPhZOMxINOKcup21sMuUB
         QLxh/WepERmwpsG/WsscZGtQyzdoeJQck/TQo60zgbstFIXJ6A9WmXxVA88YlhfBzluB
         wIRYZeMkY6sgn2qt3tSgd5U5mT8fxsMai1y23BFlezNDKN16lFVZi/dNGCO/krMouzd6
         6xBr7jvmGJAUxbxhakErFfsBgUo3GA2jFwSJxGB42HSHRfkvE7+M6FT1YBPIu0GLIPXa
         XxLA==
X-Gm-Message-State: AOJu0YzHWPR0PevApf1GT+8mdsb4V0XGTCqDectuYzpxuk9Ippo8skGJ
	V6+nwrfTcZRMAYlHvP0Fj7g8igSi4WyLbd8j8co=
X-Google-Smtp-Source: AGHT+IG/wdGcIK9K0Z2aUS74RQ+7EAINO4ZCISdXTiC4gH6o5gnkLilU2B6Gdf9NRsWD5A/eb/o3uI3mAe38nV8suJc=
X-Received: by 2002:a5d:440e:0:b0:337:3efd:37a2 with SMTP id
 z14-20020a5d440e000000b003373efd37a2mr2210153wrq.111.1704732516589; Mon, 08
 Jan 2024 08:48:36 -0800 (PST)
MIME-Version: 1.0
References: <CAPVz0n2Ky350xhOv6WvE0YhFJ9QBe59LnWvKiafs2tjFnptP+g@mail.gmail.com>
 <22115037-3a81-4a52-8e64-bc85c2be4212@broadcom.com> <CAPVz0n2Dah1b45c0yUjMZNph5AVJjneLsc2LOQ-dkXNRTv6y+Q@mail.gmail.com>
 <18cce9a7818.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <18ccea1d6d0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <BFE6B9E5-CAF5-4E30-A4A2-A2489423C961@gmail.com> <18cd08e83d0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAPVz0n347PVv28H2wswmO3N63dpfPZ0d3VrdxmQHXMoo9LS69g@mail.gmail.com> <18ce9be5470.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <18ce9be5470.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 8 Jan 2024 18:48:25 +0200
Message-ID: <CAPVz0n3BxJjaudDnC=QLHa-0NsE9JSs1ezFpwK2yb=9ySyr2cw@mail.gmail.com>
Subject: Re: License of old broadcom BT firmwares and WiFi calibration files
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 8 =D1=81=D1=96=D1=87. 2024=E2=80=AF=D1=80. =D0=BE 17:43 Arend=
 Van Spriel <arend.vanspriel@broadcom.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On January 4, 2024 10:08:04 AM Svyatoslav Ryhel <clamor95@gmail.com> wrot=
e:
>
> > =D1=81=D1=80, 3 =D1=81=D1=96=D1=87. 2024=E2=80=AF=D1=80. =D0=BE 20:20 A=
rend Van Spriel <arend.vanspriel@broadcom.com>
> > =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On January 3, 2024 6:28:33 PM Svyatoslav Ryhel <clamor95@gmail.com> wr=
ote:
> >>
> >>> 3 =D1=81=D1=96=D1=87=D0=BD=D1=8F 2024 =D1=80. 11:22:42 GMT+02:00, Are=
nd Van Spriel
> >>> <arend.vanspriel@broadcom.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=
=D0=B2(-=D0=BB=D0=B0):
> >>>> On January 3, 2024 10:14:42 AM Arend Van Spriel
> >>>> <arend.vanspriel@broadcom.com> wrote:
> >>>>
> >>>>> + linux-wireless
> >>>>> + Hans de Goede
> >>>>>
> >>>>>
> >>>>> On December 16, 2023 9:14:48 PM Svyatoslav Ryhel <clamor95@gmail.co=
m> wrote:
> >>>>>
> >>>>>> =D1=81=D0=B1, 16 =D0=B3=D1=80=D1=83=D0=B4. 2023=E2=80=AF=D1=80. =
=D0=BE 21:57 Arend van Spriel
> >>>>>> <arend.vanspriel@broadcom.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >>>>>>>
> >>>>>>> On 12/16/2023 6:45 PM, Svyatoslav Ryhel wrote:
> >>>>>>>> Greetings!
> >>>>>>>>
> >>>>>>>> I am trying to submit bluetooth firmwares (BCM4329B1.*,*.hcd and
> >>>>>>>> BCM4330B1.*,*.hcd) and wifi calibration files
> >>>>>>>> (brcmfmac4329-sdio.*,*.txt and brcmfmac4329-sdio.*,*.txt) from a=
 few
> >>>>>>>> Tegra 2 and Tegra 3 based devices into linux-fimware.
> >>>>>>>>
> >>>>>>>> I have faced ambiguous license issue since those files were part=
 of
> >>>>>>>> Android Images of different vendors. Those vendors did not provi=
de a
> >>>>>>>> license nor for android images, not for these files.
> >>>>
> >>>> Does this mean you extracted them from the android image? That proba=
bly
> >>>> never get accepted without any license information.
> >>>
> >>> Can Broadcom re-grant license to these files?
> >>>
> >>> This license is for bcm4329 in crespo
> >>> <https://android.googlesource.com/device/samsung/crespo/+/refs/heads/=
main/self-extractors/broadcom/LICENSE>
> >>
> >> Actually checked this link:
> >>
> >> https://android.googlesource.com/device/samsung/crespo/+/refs/heads/ma=
in/proprietary-blobs.txt
> >>
> >> It lists the bcm4329.hcd file as falling under Apache-2.0 license. Sam=
e for
> >> asus/grouper.
> >>
> >> Regards,
> >> Arend
> >
> > So this actually resolves ambiguity. Thanks
>
> Yes, but ... you should add them to linux-firmware under the same license=
.
> That means you need to mark them as such in the WHENCE file. Feel free to
> cc: me for the patch so I can have a look at it.
>
> Regards,
> Arend

Thank you for your assistance, it is really appreciated and valued but
it was rejected

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/114

I have referred to our conversation.
