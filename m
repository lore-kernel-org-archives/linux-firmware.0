Return-Path: <SRS0=57e+=GJ=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE97C433DB
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Jan 2021 09:19:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 331AB2310B; Wed,  6 Jan 2021 09:19:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9A2622CB9
	for <linux-firmware@kernel.org>; Wed,  6 Jan 2021 09:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9A2622CB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=hdegoede@redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609924774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zmwtZv9bM9TZ7Ejj028C1l4SDXCPo0erx005Rwy3noA=;
	b=eZ+yKXnfU3ewqsB6WJRJgd5ScSEB0cT1+ifsgQ+qc4yV0x9aVFo119jbxg67GnnjJiWg0j
	mc5vRjmnZj94dYR/DhyPTya+fQIuz9KSJfaI8fOvo2Lm0MYY25wvm9TpJa/MvG+JY0EnFH
	gIxivi20+FHlCQ1Ceau+f8KPD1PGBx8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-jgFv5rCXPgyy8Tka4Wb1VQ-1; Wed, 06 Jan 2021 04:19:32 -0500
X-MC-Unique: jgFv5rCXPgyy8Tka4Wb1VQ-1
Received: by mail-ed1-f72.google.com with SMTP id k5so1692278edk.15
        for <linux-firmware@kernel.org>; Wed, 06 Jan 2021 01:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zmwtZv9bM9TZ7Ejj028C1l4SDXCPo0erx005Rwy3noA=;
        b=Saw6fjRPhlaD5Elw47ryYJ45cHd9Ay0XHYu0cnVPnwN2+pJ0lCry6+diiB7X8BNSuo
         Rl/9F93zXoyJiVcmIIfCkHFCTKVPfeB/2p81AfZFQ5BP7HncC7wdw2S/oeOuCCE9UfHS
         dPQc7P2rMGqrri1pOd0JMpyqmwe6zvZWrcRSkVXf1WSMcAE42W+wRDEwaA3c98USKX3k
         htsqqwvzNZwflymvk+E0R7naQCFDJcrKxI02z5uouoHJoWSrrwjiRH01y/yhbUowmsJq
         WyeVtMz4CSDTRJi5SxruxNC1D2sFNrOOHRbRnCLSpC4/KQoFB/kU6lb3PZtGScWrz1RI
         J+CQ==
X-Gm-Message-State: AOAM531a40BiG+0EPcblY03NqktLykaX285r0TQZp/1pK+5o09WvSQCy
	85/edcLlp4w8yQvC9R7PtGSqPSaZ5DuOrSWBu6q3I5NtnZXFfmGE2++YU3ZcFdpeHkNiIo1CdYW
	3uAvEkZoO33cqPW3Sc/ns
X-Received: by 2002:a17:906:495b:: with SMTP id f27mr2286157ejt.338.1609924771166;
        Wed, 06 Jan 2021 01:19:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7mxULx8LZoR7y8KzZ5/96+Icb7kLUGJ206NJLG+l55GFJRhMW8Fs1s8N3gm1bu6UYZMaCUg==
X-Received: by 2002:a17:906:495b:: with SMTP id f27mr2286145ejt.338.1609924770972;
        Wed, 06 Jan 2021 01:19:30 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id j3sm991830eja.2.2021.01.06.01.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 01:19:30 -0800 (PST)
Subject: Re: [PATCH 2/2] cyprus: Link the new cyprus firmware to the old brcm
 files
To: Peter Robinson <pbrobinson@gmail.com>,
 Chi-Hsien Lin <Chi-Hsien.Lin@infineon.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org,
 Arend van Spriel <arend.vanspriel@broadcom.com>,
 SHA-cyfmac-dev-list@infineon.com, brcm80211-dev-list.pdl@broadcom.com
References: <20210105160443.156995-1-pbrobinson@gmail.com>
 <1fe934f8-9cd3-7c95-3e8e-19639d7d9b2a@infineon.com>
 <CALeDE9P6jEgOdZKCTb0MzuGARExzAUR=MddekrnBEY7H=4NR4A@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <31780fde-530e-b6c7-0774-df22baae762f@redhat.com>
Date: Wed, 6 Jan 2021 10:19:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CALeDE9P6jEgOdZKCTb0MzuGARExzAUR=MddekrnBEY7H=4NR4A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

On 1/6/21 10:17 AM, Peter Robinson wrote:
> On Wed, Jan 6, 2021 at 3:50 AM Chi-Hsien Lin <Chi-Hsien.Lin@infineon.com> wrote:
>>
>>
>> Peter Robinson 於 2021/1/6 上午 12:04 寫道:
>>> By linking the new firmware to the old file it allows exisiting
>>> kernels to make use of the new firmware and make use of the
>>> newer firmware with all the associated fixes.
>>>
>>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>>> Cc: Hans de Goede <hdegoede@redhat.com>
>>> Cc: Chi-Hsien Lin <chi-hsien.lin@cypress.com>
>>
>> (+Arend and lists)
>>
>> Hi Peter,
>>
>> The folder name is Cypress instead of cyprus. Could you please fix this
>> in v2 commit messages?
> 
> Yes, of course. I'll wait a little for some other feedback.

I thought I already send this yesterday, but I think I did the review and
then forgot to reply...

The entire series looks good to me, so for v2 you can add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

To both patches.

Regards,

Hans




>>> ---
>>>   WHENCE | 21 +++++++++++++++++++++
>>>   1 file changed, 21 insertions(+)
>>>
>>> diff --git a/WHENCE b/WHENCE
>>> index 1bd5085..354d52a 100644
>>> --- a/WHENCE
>>> +++ b/WHENCE
>>> @@ -2651,26 +2651,47 @@ Licence: Redistributable. See LICENCE.broadcom_bcm43xx for details.
>>>
>>>   File: brcm/brcmfmac4373.bin
>>>   File: cypress/cyfmac43012-sdio.bin
>>> +Link: cypress/cyfmac43012-sdio.bin -> ../brcm/brcmfmac43012-sdio.bin
>>>   File: cypress/cyfmac43012-sdio.clm_blob
>>> +Link: cypress/cyfmac43012-sdio.clm_blob -> ../brcm/brcmfmac43012-sdio.clm_blob
>>>   File: cypress/cyfmac43340-sdio.bin
>>> +Link: cypress/cyfmac43340-sdio.bin -> ../brcm/brcmfmac43340-sdio.bin
>>>   File: cypress/cyfmac43362-sdio.bin
>>> +Link: cypress/cyfmac43362-sdio.bin -> ../brcm/brcmfmac43362-sdio.bin
>>>   File: cypress/cyfmac4339-sdio.bin
>>> +Link: cypress/cyfmac4339-sdio.bin -> ../brcm/brcmfmac4339-sdio.bin
>>>   File: cypress/cyfmac43430-sdio.bin
>>> +Link: cypress/cyfmac43430-sdio.bin -> ../brcm/brcmfmac43430-sdio.bin
>>>   File: cypress/cyfmac43430-sdio.clm_blob
>>> +Link: cypress/cyfmac43430-sdio.clm_blob -> ../brcm/brcmfmac43430-sdio.clm_blob
>>>   File: cypress/cyfmac43455-sdio.bin
>>> +Link: cypress/cyfmac43455-sdio.bin -> ../brcm/brcmfmac43455-sdio.bin
>>>   File: cypress/cyfmac43455-sdio.clm_blob
>>> +Link: cypress/cyfmac43455-sdio.clm_blob -> ../brcm/brcmfmac43455-sdio.clm_blob
>>>   File: cypress/cyfmac4354-sdio.bin
>>> +Link: cypress/cyfmac4354-sdio.bin -> ../brcm/brcmfmac4354-sdio.bin
>>>   File: cypress/cyfmac4354-sdio.clm_blob
>>> +Link: cypress/cyfmac4354-sdio.clm_blob -> ../brcm/brcmfmac4354-sdio.clm_blob
>>>   File: cypress/cyfmac4356-pcie.bin
>>> +Link: cypress/cyfmac4356-pcie.bin -> ../brcm/brcmfmac4356-pcie.bin
>>>   File: cypress/cyfmac4356-pcie.clm_blob
>>> +Link: cypress/cyfmac4356-pcie.clm_blob -> ../brcm/brcmfmac4356-pcie.clm_blob
>>>   File: cypress/cyfmac4356-sdio.bin
>>> +Link: cypress/cyfmac4356-sdio.bin -> ../brcm/brcmfmac4356-sdio.bin
>>>   File: cypress/cyfmac4356-sdio.clm_blob
>>> +Link: cypress/cyfmac4356-sdio.clm_blob -> ../brcm/brcmfmac4356-sdio.clm_blob
>>>   File: cypress/cyfmac43570-pcie.bin
>>> +Link: cypress/cyfmac43570-pcie.bin -> ../brcm/brcmfmac43570-pcie.bin
>>>   File: cypress/cyfmac43570-pcie.clm_blob
>>> +Link: cypress/cyfmac43570-pcie.clm_blob -> ../brcm/brcmfmac43570-pcie.clm_blob
>>>   File: cypress/cyfmac4373-sdio.bin
>>> +Link: cypress/cyfmac4373-sdio.bin -> ../brcm/brcmfmac4373-sdio.bin
>>>   File: cypress/cyfmac4373-sdio.clm_blob
>>> +Link: cypress/cyfmac4373-sdio.clm_blob -> ../brcm/brcmfmac4373-sdio.clm_blob
>>>   File: cypress/cyfmac54591-pcie.bin
>>> +Link: cypress/cyfmac54591-pcie.bin -> ../brcm/brcmfmac54591-pcie.bin
>>>   File: cypress/cyfmac54591-pcie.clm_blob
>>> +Link: cypress/cyfmac54591-pcie.clm_blob -> ../brcm/brcmfmac54591-pcie.clm_blob
>>>
>>>   Licence: Redistributable. See LICENCE.cypress for details.
>>>
> 

