Return-Path: <SRS0=VedT=5E=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5629AC4332E
	for <linux-firmware@archiver.kernel.org>; Thu, 19 Mar 2020 12:42:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4B60920732; Thu, 19 Mar 2020 12:42:12 +0000 (UTC)
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACE6720724
	for <linux-firmware@kernel.org>; Thu, 19 Mar 2020 12:42:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JpvouByY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACE6720724
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=hdegoede@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584621730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6MPku5RjHriYmyuO6hAyd5D+QUGgn6nOd5/x7s2IwVs=;
	b=JpvouByYfeMO/iGVBaN+eKOsDRnX5M7i55EkwF6wCTndyDd5wMxtj+lmVLK9DOvp8RKwX4
	kSfWmkd6Ot1g3yAJf5gOOZ71KvvKvzMg2hRfZeWNknJ0UI9mkWgIas6aXORe0Cu/ZTA/6y
	1M0k+RtZZcePJPOKHiskG/vbf/j1QuI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-mYSch5IIOaKmYKcZhSMeMA-1; Thu, 19 Mar 2020 08:41:50 -0400
X-MC-Unique: mYSch5IIOaKmYKcZhSMeMA-1
Received: by mail-wr1-f69.google.com with SMTP id t4so956661wrr.1
        for <linux-firmware@kernel.org>; Thu, 19 Mar 2020 05:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JMWTP1FvAmqrLatWYU8wb1X6z1m+ck5CANNtYl0hBd8=;
        b=BFOTGB0Q9E3YCBD9/QAANx99FTTTJGWHS17I7cpHAJDgk4tYle9GGt7jPaxBjDP5xH
         N13QetdsWbZDeyumSP65yvZh9Q3Gmw6VoAzJ0/Wq74bOkAFuUok5Mrk9hNf2wSQTvz3v
         /t5LHvysFxHdq0rRSZwlaRoa+yq1KqVJTj7fCkEQRhAFKd9Iu1XUxhNcfgUL1bElqL3A
         ItuC0CIVlogD7l1ZOAZs0nNbXC2nvwTdstchhrJYeB0V26asRABVN6o7M61ci+2sOwuG
         Pq2AGAEhbHcQFZ1WzhAIAzSDYw3CPz1odtfh9ldKdHVqvX9L6ZTqB1YPGKwr+YCvqsH6
         rpiw==
X-Gm-Message-State: ANhLgQ2FGoYTDBUVtAig+S6Hun5I6on5C9GEaqVE6PVyJzsGBnOA03qG
	Tp7SYo7XNAz7SnHSwX/79kJNdleTNUYca6jcpPSoR//BuTivRS4/ynb6BZke7JANcss+KtWWr4X
	H40rPNAZYF/cvS+knNTnR
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr4140899wrk.101.1584621709108;
        Thu, 19 Mar 2020 05:41:49 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtvrtAr43ZhFSSZZGQnqoY1/6frmfvCc2nPfx93vuDH1GUQBIx8hURhPgVeaYUV7vjs1RlRqw==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr4140859wrk.101.1584621708665;
        Thu, 19 Mar 2020 05:41:48 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id n18sm3344646wrw.34.2020.03.19.05.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2020 05:41:48 -0700 (PDT)
Subject: Re: Updating cypress/brcm firmware in linux-firmware for
 CVE-2019-15126
From: Hans de Goede <hdegoede@redhat.com>
To: Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
 Chung-Hsien Hsu <cnhu@cypress.com>,
 Christopher Rumpf <Christopher.Rumpf@cypress.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <93dba8d2-6e46-9157-d292-4d93feb8ec1a@redhat.com>
 <f7f5076f-d799-7c5c-90e9-3ad781ef96a9@redhat.com>
Message-ID: <437b92f4-71c5-7f60-5764-668cc6cc16d8@redhat.com>
Date: Thu, 19 Mar 2020 13:41:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f7f5076f-d799-7c5c-90e9-3ad781ef96a9@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Message-ID: <20200319124147.PyvqXnAWOQd-eZgqj3j_fmqnpRT_AjpSLRWPDAsyOPQ@z>

Hi All,

Relaying Chris Rumpf's answer here again because of
his email issues:

On 3/18/20 11:06 PM, Hans de Goede wrote:
> Hi All,
>=20
> On 2/26/20 11:16 PM, Hans de Goede wrote:
>> Hello Cypress people,
>>
>> Can we please get updated firmware for
>> brcm/brcmfmac4356-pcie.bin and brcm/brcmfmac4356-sdio.bin
>> fixing CVE-2019-15126 as well as for any other affected
>> models (the 4356 is explicitly named in the CVE description) ?
>>
>> The current Cypress firmware files in linux-firmware are
>> quite old, e.g. for brcm/brcmfmac4356-pcie.bin linux-firmware has:
>> version 7.35.180.176 dated 2017-10-23, way before the CVE
>>
>> Where as https://community.cypress.com/docs/DOC-19000 /
>> cypress-fmac-v4.14.77-2020_0115.zip has:
>> version 7.35.180.197 which presumably contains a fix (no changelog)
>=20
> Chris from Cypress has replied privately to me because of some
> email issues, with the request to relay the information he
> wrote here:
>=20
> On 3/18/20 6:54 PM, Christopher Rumpf wrote:
>=20
>  > =E2=80=83Cypress' CLM upstream policy is currently fragmented, as you =
have indicated.
>  > The 43340 and 43362 have embedded CLM upstreamed yet no other Cypress =
parts
>  > have done so and only deliver the firmware.bin files.=C2=A0 Cypress' c=
ustomers
>  > have been OK to follow this technote
>  > https://www.cypress.com/documentation/application-notes/an225347-cypre=
ss-wi-fi-clm-regulatory-manual
>  > which requires users to contact Cypress support to obtain the best per=
forming
>  > Country Locale Matrix (CLM) for the Wi-Fi module and targeted regions.
>  > Such a model is of course not ideal for the open source community or f=
or
>  > what we=C2=A0 call =E2=80=9Cthe broad market=E2=80=9D as it requires a=
n extra human to human
>  > interaction that at the end of the day may reduce the user's time to
>  > market and ability to independently move forward.
>  >
>  > =E2=80=83As I am sure you are aware, Cypress=E2=80=99 Embedded CLM =3D=
 Wi-Fi Firmware +
>  > regional regulatory database + RF settings (NVRAM).=C2=A0 The Wi-Fi Fi=
rmware is
>  > static across all projects however the regional regulatory database an=
d the
>  > RF settings are implementation specific.=C2=A0 Previously the hesitati=
on to
>  > release a "worldwide generic embedded CLM=E2=80=9D was because the reg=
ional
>  > regulatory and RF settings are not tuned correctly for the implementat=
ion's
>  > characteristics and the project may experience sub-par connectivity
>  > performance or even perceived defects (such as power, RF, robustness).
>  >
>  >=E2=80=83In the long term Cypress will be investing in additional tooli=
ng to automate
>  > these steps, perhaps even as part of the project's config or build ste=
p.
>  >
>  >=E2=80=83In the short term Cypress is considering these two actions:
>  >
>  > 1. For all active upstreamed Cypress parts, Cypress will upstream a
>  >=C2=A0=C2=A0=C2=A0 "worldwide generic embedded CLM=E2=80=9D.=C2=A0 Thes=
e Embedded CLMs won=E2=80=99t be tuned for
>  >=C2=A0=C2=A0=C2=A0 specific project=E2=80=99s regional or RF settings a=
nd customers may still need
>  >=C2=A0=C2=A0=C2=A0 to reach out to Cypress support but at least they wi=
ll be able to use the
>  >=C2=A0=C2=A0=C2=A0 Cypress firmware in the linux-firmware repo right ou=
t of the box.
>=20
> Note Chris later send me some clarification on this point:
>=20
> On 3/18/20 10:29 PM, Christopher Rumpf wrote:
>  > One clarification here! Regarding the short term solution -
>  > the delivery may not be =E2=80=9Cembedded clm=E2=80=9D.=C2=A0 It may b=
e three different artifacts
>  > which are meant to service the broad market. The Cypress R&D team will=
 decide
>  > the specifics of how to address the technical implementation to delive=
r the
>  > worldwide clm.
>=20
> The below is a continuation of Chris' original email:
>=20
>  >=C2=A0 2. Cypress will add some more documentation in our READMEs and o=
ther
>  >=C2=A0=C2=A0=C2=A0=C2=A0 supporting docs that discusses the risks which
>  >=C2=A0=C2=A0=C2=A0=C2=A0 "worldwide generic embedded CLM=E2=80=9D bring=
s.=C2=A0 Customers can then make
>  >=C2=A0=C2=A0=C2=A0=C2=A0 their own decision to engage with Cypress supp=
ort which will depend
>  >=C2=A0=C2=A0=C2=A0=C2=A0 on the characteristics of their project, I wou=
ld imagine.
>  >
>  > Cypress would be able to implement these actions for the next release =
train
>  > which will be posted somewhere around end of June (pending any impact =
due
>  > to the coronavirus).
>  >
>  > Would these short and long term solutions meet the needs of the
>  > linux-firmware community?=C2=A0 If no, may we collaborate more?
>=20
> Chris, if I understand you correctly then the plan would result in the Cy=
press
> maintained firmwares in linux-firmware being in sync (being the same vers=
ions
> but with a more generic CLM) with the firmwares Cypress releases as part =
of
> their SDK; and the first time we would see this in sync. release of Cypre=
ss
> maintained firmwares would be around June. Correct?

On 3/18/20 11:19 PM, Christopher Rumpf wrote:

The understanding of the solution and the timeline is correct.

> This sounds very good to me.
>=20
> I do have one question though, you describe the firmware as consisting of
> 3 parts: The actual firmware, the Country Locale Matrix and the NVRAM.
>=20
> Currently linux-firmware contains firmwares with a generic CLM embedded
> in them. But AFAIK the nvram-s are device-model/project specific (more so
> then the CLM-s I believe) and normally the nvram is actual part of the
> device and read by the kernel driver?=C2=A0 The one exception to this is =
the
> nvram files for some SDIO boards. Recent kernels have code to load
> the nvram files for these SDIO boards using a device-model specific
> name and the linux-firmware repository contains community contributed
> NVRAM files for various device-models. Would this change with the
> new firmware versions ?

On 3/18/20 11:19 PM, Christopher Rumpf wrote:

No changes here.  My bad, I probably should have written this:
 > Cypress=E2=80=99 Embedded CLM =3D Wi-Fi Firmware + regional regulatory d=
atabase + RF settings (NVRAM).
as
Cypress=E2=80=99 Solution =3D Wi-Fi Firmware + regional regulatory database=
 (CLM) + RF settings (NVRAM).

The idea/architecture here is to allow for these software parts to change
independently. So yes, users can change nvram (or CLM or the firmware itsel=
f)
and still use the overall solution.

Regards,

Hans

