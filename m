Return-Path: <SRS0=8hji=5D=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FB2C4332D
	for <linux-firmware@archiver.kernel.org>; Wed, 18 Mar 2020 22:06:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3FDE720754; Wed, 18 Mar 2020 22:06:53 +0000 (UTC)
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1B3C20752
	for <linux-firmware@kernel.org>; Wed, 18 Mar 2020 22:06:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZEYSOk1h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1B3C20752
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=hdegoede@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584569211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hLOknRqH5gJRghxT+VPHZcs7kpCmCxleVcm3uyviQNk=;
	b=ZEYSOk1hXmOLTB0cduiScVE+ZrAE9rqlffG+6cXYczj+6F9o0ZqmD+5WxmW3IVNzfh0kfL
	Zxh76y2biTP9obqLRSuPNxUBuJXHfHP2HvOVWRYtx9Mx2lE7urxJVCtAXkkopUv4eFHnoy
	69HO2CX8Brnui2BSgJHalJMra8iiq9w=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-vo847tg4N2CYc4mg-Bc7Ag-1; Wed, 18 Mar 2020 18:06:32 -0400
X-MC-Unique: vo847tg4N2CYc4mg-Bc7Ag-1
Received: by mail-wm1-f69.google.com with SMTP id f207so126670wme.6
        for <linux-firmware@kernel.org>; Wed, 18 Mar 2020 15:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=14t4HjIQMqA+ULzOv7X6FcxbMiKkPDMaZzG1d8eZBno=;
        b=PQfwpREnqIpwChK54wwvFumqWPZALX6ZCG/5C+cBqKa1xV0A+sxz2pXILl3dTaIbrQ
         0PToGrv7SlU38rfsWJQVl69ecvyA+ajUFhXe95hyV3iIVdeOhKFNIqIM4a6P+jkOnQ2Q
         o9DW1JO4/j7cJYmI7knwUGT5p8waSxiAeoCWybO7QTai2+mAiopGcGnejGj4eTTYmuGc
         QOhCSCNdFUPC4jUcYrzcFzYBOdU86Du0yZgAQXs5Qi/G/tsCDubGlXkMdR0y+Z7JYVl3
         EXAFMbKM1TUKXowmrhFSdGl/pa5XHr0xRfMDwehNHh6VbQRrlnsaHha0+BZ+7Yj38deo
         HmyQ==
X-Gm-Message-State: ANhLgQ308ENf1KSNDpdwZ4LKiEyKpYYd8CZJwMoTfIga3iZQ9Iv74f86
	WLf/JQSEx191NOGZfu3jIlEoWEKcBRodo8NzkRPbf7NaoQOdQy+LnCVV3RLCzoXxjFxt135zz+N
	1vQ3GK51KX7mlyV+mTKQT
X-Received: by 2002:a05:6000:10c6:: with SMTP id b6mr65440wrx.130.1584569191393;
        Wed, 18 Mar 2020 15:06:31 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vshXi2bFCTY0GiaK4KHLwbxxmTP/J7PmFuoSbyu55J8ItmB/ndud1KHLF+/1Ov96kHePRHVEA==
X-Received: by 2002:a05:6000:10c6:: with SMTP id b6mr65417wrx.130.1584569191098;
        Wed, 18 Mar 2020 15:06:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id t126sm200794wmb.27.2020.03.18.15.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2020 15:06:30 -0700 (PDT)
Subject: Re: Updating cypress/brcm firmware in linux-firmware for
 CVE-2019-15126
From: Hans de Goede <hdegoede@redhat.com>
To: Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
 Chirjeev Singh <Chirjeev.Singh@cypress.com>,
 Chung-Hsien Hsu <cnhu@cypress.com>,
 Christopher Rumpf <Christopher.Rumpf@cypress.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <93dba8d2-6e46-9157-d292-4d93feb8ec1a@redhat.com>
Message-ID: <f7f5076f-d799-7c5c-90e9-3ad781ef96a9@redhat.com>
Date: Wed, 18 Mar 2020 23:06:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <93dba8d2-6e46-9157-d292-4d93feb8ec1a@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi All,

On 2/26/20 11:16 PM, Hans de Goede wrote:
> Hello Cypress people,
>=20
> Can we please get updated firmware for
> brcm/brcmfmac4356-pcie.bin and brcm/brcmfmac4356-sdio.bin
> fixing CVE-2019-15126 as well as for any other affected
> models (the 4356 is explicitly named in the CVE description) ?
>=20
> The current Cypress firmware files in linux-firmware are
> quite old, e.g. for brcm/brcmfmac4356-pcie.bin linux-firmware has:
> version 7.35.180.176 dated 2017-10-23, way before the CVE
>=20
> Where as https://community.cypress.com/docs/DOC-19000 /
> cypress-fmac-v4.14.77-2020_0115.zip has:
> version 7.35.180.197 which presumably contains a fix (no changelog)

Chris from Cypress has replied privately to me because of some
email issues, with the request to relay the information he
wrote here:

On 3/18/20 6:54 PM, Christopher Rumpf wrote:

 > =E2=80=83Cypress' CLM upstream policy is currently fragmented, as you ha=
ve indicated.
 > The 43340 and 43362 have embedded CLM upstreamed yet no other Cypress pa=
rts
 > have done so and only deliver the firmware.bin files.  Cypress' customer=
s
 > have been OK to follow this technote
 > https://www.cypress.com/documentation/application-notes/an225347-cypress=
-wi-fi-clm-regulatory-manual
 > which requires users to contact Cypress support to obtain the best perfo=
rming
 > Country Locale Matrix (CLM) for the Wi-Fi module and targeted regions.
 > Such a model is of course not ideal for the open source community or for
 > what we  call =E2=80=9Cthe broad market=E2=80=9D as it requires an extra=
 human to human
 > interaction that at the end of the day may reduce the user's time to
 > market and ability to independently move forward.
 >
 > =E2=80=83As I am sure you are aware, Cypress=E2=80=99 Embedded CLM =3D W=
i-Fi Firmware +
 > regional regulatory database + RF settings (NVRAM).  The Wi-Fi Firmware =
is
 > static across all projects however the regional regulatory database and =
the
 > RF settings are implementation specific.  Previously the hesitation to
 > release a "worldwide generic embedded CLM=E2=80=9D was because the regio=
nal
 > regulatory and RF settings are not tuned correctly for the implementatio=
n's
 > characteristics and the project may experience sub-par connectivity
 > performance or even perceived defects (such as power, RF, robustness).
 >
 >=E2=80=83In the long term Cypress will be investing in additional tooling=
 to automate
 > these steps, perhaps even as part of the project's config or build step.
 >
 >=E2=80=83In the short term Cypress is considering these two actions:
 >
 > 1. For all active upstreamed Cypress parts, Cypress will upstream a
 >    "worldwide generic embedded CLM=E2=80=9D.  These Embedded CLMs won=E2=
=80=99t be tuned for
 >    specific project=E2=80=99s regional or RF settings and customers may =
still need
 >    to reach out to Cypress support but at least they will be able to use=
 the
 >    Cypress firmware in the linux-firmware repo right out of the box.

Note Chris later send me some clarification on this point:

On 3/18/20 10:29 PM, Christopher Rumpf wrote:
 > One clarification here! Regarding the short term solution -
 > the delivery may not be =E2=80=9Cembedded clm=E2=80=9D.  It may be three=
 different artifacts
 > which are meant to service the broad market. The Cypress R&D team will d=
ecide
 > the specifics of how to address the technical implementation to deliver =
the
 > worldwide clm.

The below is a continuation of Chris' original email:

 >  2. Cypress will add some more documentation in our READMEs and other
 >     supporting docs that discusses the risks which
 >     "worldwide generic embedded CLM=E2=80=9D brings.  Customers can then=
 make
 >     their own decision to engage with Cypress support which will depend
 >     on the characteristics of their project, I would imagine.
 >
 > Cypress would be able to implement these actions for the next release tr=
ain
 > which will be posted somewhere around end of June (pending any impact du=
e
 > to the coronavirus).
 >
 > Would these short and long term solutions meet the needs of the
 > linux-firmware community?  If no, may we collaborate more?

Chris, if I understand you correctly then the plan would result in the Cypr=
ess
maintained firmwares in linux-firmware being in sync (being the same versio=
ns
but with a more generic CLM) with the firmwares Cypress releases as part of
their SDK; and the first time we would see this in sync. release of Cypress
maintained firmwares would be around June. Correct?

This sounds very good to me.

I do have one question though, you describe the firmware as consisting of
3 parts: The actual firmware, the Country Locale Matrix and the NVRAM.

Currently linux-firmware contains firmwares with a generic CLM embedded
in them. But AFAIK the nvram-s are device-model/project specific (more so
then the CLM-s I believe) and normally the nvram is actual part of the
device and read by the kernel driver?  The one exception to this is the
nvram files for some SDIO boards. Recent kernels have code to load
the nvram files for these SDIO boards using a device-model specific
name and the linux-firmware repository contains community contributed
NVRAM files for various device-models. Would this change with the
new firmware versions ?

Regards,

Hans

