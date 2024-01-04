Return-Path: <SRS0=+Oot=IO=gmail.com=clamor95@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAD9C47074
	for <linux-firmware@archiver.kernel.org>; Thu,  4 Jan 2024 09:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D648EC433C9; Thu,  4 Jan 2024 09:08:06 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D6A5C433C7
	for <linux-firmware@kernel.org>; Thu,  4 Jan 2024 09:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D6A5C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-33723ad790cso223053f8f.1
        for <linux-firmware@kernel.org>; Thu, 04 Jan 2024 01:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704359284; x=1704964084; darn=kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vu69+F4VLRlaBCdU/TQtcQNi2BkTn42ySbPdCve9vZE=;
        b=m/IP6N7i47v13D3/79Np4UH1ZgpgERcxf7Px7iT0RyQdhWYzBxpCLxHrjcThPYW6zj
         riaXivJdBPrgzwr3DSqV41kdYhKh0sDaFrjHV4U3ZTdf2lzfRqqEMIArYGUDPkkd+J9S
         n5NFsH/ngb/2TLONzVGAfvpR2n6JmGzRerCByjWRs2U5mPmPmNKs0h12ONX355+bzKJq
         tYrDoCRbKAXK02Q5dP/yy4u1bDN48e6hgpHgRFQLjCmXbZGhIsbIN+Q9mNUtHtaVU3Ov
         dUec2bWwkM3/mVZktFAtfkXjyuO3pUAs/JiHxYGuylDMJOcHcmL/vf6eRzlHuyoAceE+
         18kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704359284; x=1704964084;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vu69+F4VLRlaBCdU/TQtcQNi2BkTn42ySbPdCve9vZE=;
        b=rayla+yasRceqTsQzpTmrcxVQ/X1rrz3LtQGoZ8JMQC/xSotjtBJraL3wyAI9/7vH+
         ZGlK0KAYtkVUigz5ov40AF2gXjvezNQvPAGB/O5ikgdmsKg3TBaFRJ+zyVl3AxHwQTse
         fY/ZDJGoqS67jisESws9QRnaMO4t+M/kN6MeQ6KGZTedm9vTKSHatguAkVP1ZZIYhCOM
         SapOUHzoSQAPSOMyJopfEyopAX9uXypsXA2tCoCHVGmO6sk1uADj+/Dp55t0+1TE+Edx
         ATUrHE+o8LzvlSmNysVWNH9ZROdeTjUO0/VrBspZB82/0WJCHgtoZ2F4/44vxFaXh24m
         2fVg==
X-Gm-Message-State: AOJu0YyFVPyRBi+P2mbjOy3E+szJj2laK81d9s/B05FvrKQR5gqFtq4Q
	BORA8EAZAcg59dbqJ7U5r5nhmddPcI4sOwZ4JYCDgUd9
X-Google-Smtp-Source: AGHT+IFnLkTxcruD7Hp1LV4wDr6+30vNm48XHdgQUg4VzXCoYkEGYb5bRjLqoDMIRwbBgeRfzf13lL8tY47F3kq0esI=
X-Received: by 2002:adf:e601:0:b0:336:4308:28df with SMTP id
 p1-20020adfe601000000b00336430828dfmr120570wrm.204.1704359283391; Thu, 04 Jan
 2024 01:08:03 -0800 (PST)
MIME-Version: 1.0
References: <CAPVz0n2Ky350xhOv6WvE0YhFJ9QBe59LnWvKiafs2tjFnptP+g@mail.gmail.com>
 <22115037-3a81-4a52-8e64-bc85c2be4212@broadcom.com> <CAPVz0n2Dah1b45c0yUjMZNph5AVJjneLsc2LOQ-dkXNRTv6y+Q@mail.gmail.com>
 <18cce9a7818.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <18ccea1d6d0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <BFE6B9E5-CAF5-4E30-A4A2-A2489423C961@gmail.com> <18cd08e83d0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <18cd08e83d0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 4 Jan 2024 11:07:52 +0200
Message-ID: <CAPVz0n347PVv28H2wswmO3N63dpfPZ0d3VrdxmQHXMoo9LS69g@mail.gmail.com>
Subject: Re: License of old broadcom BT firmwares and WiFi calibration files
List-Id: <linux-firmware.lore.kernel.org>
To: Arend Van Spriel <arend.vanspriel@broadcom.com>, linux-wireless@vger.kernel.org, 
	linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 3 =D1=81=D1=96=D1=87. 2024=E2=80=AF=D1=80. =D0=BE 20:20 Arend=
 Van Spriel <arend.vanspriel@broadcom.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On January 3, 2024 6:28:33 PM Svyatoslav Ryhel <clamor95@gmail.com> wrote=
:
>
> > 3 =D1=81=D1=96=D1=87=D0=BD=D1=8F 2024 =D1=80. 11:22:42 GMT+02:00, Arend=
 Van Spriel
> > <arend.vanspriel@broadcom.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=
=B2(-=D0=BB=D0=B0):
> >> On January 3, 2024 10:14:42 AM Arend Van Spriel
> >> <arend.vanspriel@broadcom.com> wrote:
> >>
> >>> + linux-wireless
> >>> + Hans de Goede
> >>>
> >>>
> >>> On December 16, 2023 9:14:48 PM Svyatoslav Ryhel <clamor95@gmail.com>=
 wrote:
> >>>
> >>>> =D1=81=D0=B1, 16 =D0=B3=D1=80=D1=83=D0=B4. 2023=E2=80=AF=D1=80. =D0=
=BE 21:57 Arend van Spriel
> >>>> <arend.vanspriel@broadcom.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >>>>>
> >>>>> On 12/16/2023 6:45 PM, Svyatoslav Ryhel wrote:
> >>>>>> Greetings!
> >>>>>>
> >>>>>> I am trying to submit bluetooth firmwares (BCM4329B1.*,*.hcd and
> >>>>>> BCM4330B1.*,*.hcd) and wifi calibration files
> >>>>>> (brcmfmac4329-sdio.*,*.txt and brcmfmac4329-sdio.*,*.txt) from a f=
ew
> >>>>>> Tegra 2 and Tegra 3 based devices into linux-fimware.
> >>>>>>
> >>>>>> I have faced ambiguous license issue since those files were part o=
f
> >>>>>> Android Images of different vendors. Those vendors did not provide=
 a
> >>>>>> license nor for android images, not for these files.
> >>
> >> Does this mean you extracted them from the android image? That probabl=
y
> >> never get accepted without any license information.
> >
> > Can Broadcom re-grant license to these files?
> >
> > This license is for bcm4329 in crespo
> > <https://android.googlesource.com/device/samsung/crespo/+/refs/heads/ma=
in/self-extractors/broadcom/LICENSE>
>
> Actually checked this link:
>
> https://android.googlesource.com/device/samsung/crespo/+/refs/heads/main/=
proprietary-blobs.txt
>
> It lists the bcm4329.hcd file as falling under Apache-2.0 license. Same f=
or
> asus/grouper.
>
> Regards,
> Arend

So this actually resolves ambiguity. Thanks

Best regards,
Svyatoslav R.
