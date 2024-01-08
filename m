Return-Path: <SRS0=II4c=IS=gmail.com=clamor95@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84433C3DA6E
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Jan 2024 19:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B016C433C7; Mon,  8 Jan 2024 19:16:14 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 509B3C433C8
	for <linux-firmware@kernel.org>; Mon,  8 Jan 2024 19:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 509B3C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so236482066b.2
        for <linux-firmware@kernel.org>; Mon, 08 Jan 2024 11:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704741371; x=1705346171; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V2+hZm0MaHSwqVI2yvf7lr17Wbh0R7QsKUw0eeM77J4=;
        b=KkU84CoWHBF5oGcVKoNt5SFPtPfZmcCamcrxAkBhG6W0FTUILbHapymYedj2Dj5Za5
         dg9yGZfkc8NSDjzorfjLAa6fyjhBpt6+kZe5sZ1j3XfCtVh5yPII69Wfoc5ncvbDfPbd
         /48ZxvlVDYHaPnJg+5ygOh1FmR01apd51AnOc8rbCPGr+6GJibSgqq/OsOvbNfiyS2zm
         Tk5Uw2db4s82ZiOCGXznr108XTsFEs/R9ERTotMeR8j+qEU6Z6gCS1rXYW5xThcp1k6D
         XRWTnFukgOLwhrfCf8tbto0z+9SO9aHyfirh7fb9r3mMGKx2DoCLhhF0ZshF6r1+UqfV
         Og8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704741371; x=1705346171;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2+hZm0MaHSwqVI2yvf7lr17Wbh0R7QsKUw0eeM77J4=;
        b=TUi3R41L2dvJjKx8JIQgcW9UzoPFvSzF/MrXJ8sUtnHyZuFgGwcGW8CSAbIzP2ib4s
         tXno7vMcKxRyLbjJ+vgbhP6ADsnS3gnQYgkPe093Sqmo/4OANoqxNGwu9O30UFj/6YGt
         RLaJPREQxAIaRqpoLUxue8741sQnjTztBFPnzdi1R7pGAk3s9DGwlSiqFu7X80uqSONK
         7exijlZkGjMMLWP57HxFGvW5zxdEGnM9hen7jfK6fDmZEY0WffhguZ5N8lzamqc1Eq55
         aCGp5tnM3nVgAU/PtC661ybn5mA2sXFu+8T3X53ykw/tQCWXaPzEZx3Gc0U0BA3uLCFw
         b+Cw==
X-Gm-Message-State: AOJu0YzW5g5xpxf7YdqsA3t6TCuHrkJXvBy9JUnTx17ZcgUoiIXISY3f
	KI6hEeHyjqO0rnPME2EzrBc=
X-Google-Smtp-Source: AGHT+IFPvIFjdhz64vLG9bABAaY8OMMCwSJDDHeIRYiD4YiJZvGJhv7fhpJzYjb47ld4X5tSGLqZkw==
X-Received: by 2002:a17:906:28d2:b0:a27:ee21:5be with SMTP id p18-20020a17090628d200b00a27ee2105bemr1149879ejd.178.1704741371348;
        Mon, 08 Jan 2024 11:16:11 -0800 (PST)
Received: from [127.0.0.1] ([46.211.247.159])
        by smtp.gmail.com with ESMTPSA id z26-20020a170906271a00b00a2b10e20292sm168356ejc.215.2024.01.08.11.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 11:16:11 -0800 (PST)
Date: Mon, 08 Jan 2024 21:16:10 +0200
From: Svyatoslav <clamor95@gmail.com>
To: Arend Van Spriel <aspriel@gmail.com>,
 Arend Van Spriel <arend.vanspriel@broadcom.com>
List-Id: <linux-firmware.lore.kernel.org>
CC: linux-wireless@vger.kernel.org, linux-firmware@kernel.org,
 linux-bluetooth@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>
Subject: Re: License of old broadcom BT firmwares and WiFi calibration files
User-Agent: K-9 Mail for Android
In-Reply-To: <a1a3683b-9d47-41e8-a527-17bdca1607ba@gmail.com>
References: <CAPVz0n2Ky350xhOv6WvE0YhFJ9QBe59LnWvKiafs2tjFnptP+g@mail.gmail.com> <22115037-3a81-4a52-8e64-bc85c2be4212@broadcom.com> <CAPVz0n2Dah1b45c0yUjMZNph5AVJjneLsc2LOQ-dkXNRTv6y+Q@mail.gmail.com> <18cce9a7818.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com> <18ccea1d6d0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com> <BFE6B9E5-CAF5-4E30-A4A2-A2489423C961@gmail.com> <18cd08e83d0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com> <CAPVz0n347PVv28H2wswmO3N63dpfPZ0d3VrdxmQHXMoo9LS69g@mail.gmail.com> <18ce9be5470.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com> <CAPVz0n3BxJjaudDnC=QLHa-0NsE9JSs1ezFpwK2yb=9ySyr2cw@mail.gmail.com> <18cea3af2c8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com> <CAPVz0n3-nirqD9XW+-R_Uh8Ehkm2WKcxa3ZTp8TiOUf7gz+wKA@mail.gmail.com> <a1a3683b-9d47-41e8-a527-17bdca1607ba@gmail.com>
Message-ID: <397291D1-1657-4560-9E7C-57C890BD84FB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



8 =D1=81=D1=96=D1=87=D0=BD=D1=8F 2024=E2=80=AF=D1=80=2E 21:03:09 GMT+02:00=
, Arend Van Spriel <aspriel@gmail=2Ecom> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=
=B0=D0=B2(-=D0=BB=D0=B0):
>+ linux-bluetooth
>+ Marcel
>
>On 1/8/2024 7:21 PM, Svyatoslav Ryhel wrote:
>> =D0=BF=D0=BD, 8 =D1=81=D1=96=D1=87=2E 2024=E2=80=AF=D1=80=2E =D0=BE 19:=
59 Arend Van Spriel <arend=2Evanspriel@broadcom=2Ecom> =D0=BF=D0=B8=D1=88=
=D0=B5:
>>>=20
>>> On January 8, 2024 5:48:37 PM Svyatoslav Ryhel <clamor95@gmail=2Ecom> =
wrote:
>>>=20
>>>> =D0=BF=D0=BD, 8 =D1=81=D1=96=D1=87=2E 2024=E2=80=AF=D1=80=2E =D0=BE 1=
7:43 Arend Van Spriel <arend=2Evanspriel@broadcom=2Ecom>
>>>> =D0=BF=D0=B8=D1=88=D0=B5:
>>>>>=20
>>>>> On January 4, 2024 10:08:04 AM Svyatoslav Ryhel <clamor95@gmail=2Eco=
m> wrote:
>>>>>=20
>>>>>> =D1=81=D1=80, 3 =D1=81=D1=96=D1=87=2E 2024=E2=80=AF=D1=80=2E =D0=BE=
 20:20 Arend Van Spriel <arend=2Evanspriel@broadcom=2Ecom>
>>>>>> =D0=BF=D0=B8=D1=88=D0=B5:
>>>>>>>=20
>>>>>>> On January 3, 2024 6:28:33 PM Svyatoslav Ryhel <clamor95@gmail=2Ec=
om> wrote:
>>>>>>>=20
>>>>>>>> 3 =D1=81=D1=96=D1=87=D0=BD=D1=8F 2024 =D1=80=2E 11:22:42 GMT+02:0=
0, Arend Van Spriel
>>>>>>>> <arend=2Evanspriel@broadcom=2Ecom> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=
=D0=B0=D0=B2(-=D0=BB=D0=B0):
>>>>>>>>> On January 3, 2024 10:14:42 AM Arend Van Spriel
>>>>>>>>> <arend=2Evanspriel@broadcom=2Ecom> wrote:
>>>>>>>>>=20
>>>>>>>>>> + linux-wireless
>>>>>>>>>> + Hans de Goede
>>>>>>>>>>=20
>>>>>>>>>>=20
>>>>>>>>>> On December 16, 2023 9:14:48 PM Svyatoslav Ryhel <clamor95@gmai=
l=2Ecom> wrote:
>>>>>>>>>>=20
>>>>>>>>>>> =D1=81=D0=B1, 16 =D0=B3=D1=80=D1=83=D0=B4=2E 2023=E2=80=AF=D1=
=80=2E =D0=BE 21:57 Arend van Spriel
>>>>>>>>>>> <arend=2Evanspriel@broadcom=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5:
>>>>>>>>>>>>=20
>>>>>>>>>>>> On 12/16/2023 6:45 PM, Svyatoslav Ryhel wrote:
>>>>>>>>>>>>> Greetings!
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> I am trying to submit bluetooth firmwares (BCM4329B1=2E*,*=
=2Ehcd and
>>>>>>>>>>>>> BCM4330B1=2E*,*=2Ehcd) and wifi calibration files
>>>>>>>>>>>>> (brcmfmac4329-sdio=2E*,*=2Etxt and brcmfmac4329-sdio=2E*,*=
=2Etxt) from a few
>>>>>>>>>>>>> Tegra 2 and Tegra 3 based devices into linux-fimware=2E
>>>>>>>>>>>>>=20
>>>>>>>>>>>>> I have faced ambiguous license issue since those files were =
part of
>>>>>>>>>>>>> Android Images of different vendors=2E Those vendors did not=
 provide a
>>>>>>>>>>>>> license nor for android images, not for these files=2E
>>>>>>>>>=20
>>>>>>>>> Does this mean you extracted them from the android image? That p=
robably
>>>>>>>>> never get accepted without any license information=2E
>>>>>>>>=20
>>>>>>>> Can Broadcom re-grant license to these files?
>>>>>>>>=20
>>>>>>>> This license is for bcm4329 in crespo
>>>>>>>> <https://android=2Egooglesource=2Ecom/device/samsung/crespo/+/ref=
s/heads/main/self-extractors/broadcom/LICENSE>
>>>>>>>=20
>>>>>>> Actually checked this link:
>>>>>>>=20
>>>>>>> https://android=2Egooglesource=2Ecom/device/samsung/crespo/+/refs/=
heads/main/proprietary-blobs=2Etxt
>>>>>>>=20
>>>>>>> It lists the bcm4329=2Ehcd file as falling under Apache-2=2E0 lice=
nse=2E Same for
>>>>>>> asus/grouper=2E
>>>>>>>=20
>>>>>>> Regards,
>>>>>>> Arend
>>>>>>=20
>>>>>> So this actually resolves ambiguity=2E Thanks
>>>>>=20
>>>>> Yes, but =2E=2E=2E you should add them to linux-firmware under the s=
ame license=2E
>>>>> That means you need to mark them as such in the WHENCE file=2E Feel =
free to
>>>>> cc: me for the patch so I can have a look at it=2E
>>>>>=20
>>>>> Regards,
>>>>> Arend
>>>>=20
>>>> Thank you for your assistance, it is really appreciated and valued bu=
t
>>>> it was rejected
>>>>=20
>>>> https://gitlab=2Ecom/kernel-firmware/linux-firmware/-/merge_requests/=
114
>>>>=20
>>>> I have referred to our conversation=2E
>>>=20
>>> I see and it seems they were correct=2E My bad=2E Clearly should not t=
ry a
>>> career as lawyer=2E
>>>=20
>>> I can try to publish them to linux-firmware, but I have to ask interna=
lly=2E
>>>=20
>>> Regards,
>>> Arend
>>>=20
>>=20
>> Thank you, looking forward to your answer=2E But keep in mind that
>> generic firmware for bluetooth might not be an option=2E I have tried t=
o
>> shuffle them and bluetooth failed=2E
>
>Okay=2E I guess there is a naming scheme that btbcm=2Eko uses=2E Will loo=
k in the source file how it loads firmware/patch=2E Actually your merge req=
uest would also tell me=2E That involves a whole lot more firmware files th=
an what we discussed earlier=2E
>
>Regards,
>Arend

Uh, yes, I am terribly sorry about that=2E I was looking for analogies wit=
h existing publishes of firmwares since bt firmware occurred to be not inte=
rchangeable=2E I have no hopes that any of them will be accepted, so if any=
 passes then good=2E
