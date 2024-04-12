Return-Path: <SRS0=4JMA=LR=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8672C4345F
	for <linux-firmware@archiver.kernel.org>; Fri, 12 Apr 2024 10:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8774FC113CD; Fri, 12 Apr 2024 10:30:50 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 650C2C113CC
	for <linux-firmware@kernel.org>; Fri, 12 Apr 2024 10:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 650C2C113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712917848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tv3Cp/IB8iyppgUJfCH4cTWkE8c2+S9oUeOtnKxb59o=;
	b=TfL44u1bPTrNF+cJ8g0HeaT6F0+sMqjnQRmsMj3EmTfd/W2ikBkyYDFclXFmgkpQBEtxiS
	1yalAnCjMmJOVHuVT0p4tRD/3ABGX273dQAw4/JiGlUDgSkoMZS5o8KpcTSXByMaWjv3UE
	ZrIWaOIjoROY9E9jzvvYkcAA87UEjDI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-Fv67w8RhMsK78HSZWE0PXA-1; Fri, 12 Apr 2024 06:30:47 -0400
X-MC-Unique: Fv67w8RhMsK78HSZWE0PXA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5684c1abc7fso420153a12.3
        for <linux-firmware@kernel.org>; Fri, 12 Apr 2024 03:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712917846; x=1713522646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tv3Cp/IB8iyppgUJfCH4cTWkE8c2+S9oUeOtnKxb59o=;
        b=OnozUnocmk0X6cxpji8TYeVCQf76KUc7C11K3TshKYX+VSKa41YyW/CpyaDMHRvSAM
         tb8p27DEf7VhEEUBZZASZ/LJNC8j4Osi826qTr4fuIsH3oJRQ4leuJQ1Qp5g50EsxLVT
         mqAbCx4Tln7jjgx2ZKqsaLYSgXeWzJU4trPS6dyEQz7EGluhofvGfeZ61r0B2nsNEJKd
         VoyIFEBPJoYp6FV2chMYbQvhpenL529bJQ8Wlk4+SAG8saYEKnld1OruDLoF+3LMJ/V1
         O0fqu+WFMrNMH0X4QMfMqm/O15Zx/B0APsl03i4JCSicWW6qsbf5IiZgywkoyO8BstQu
         iwuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFMCa31RC8l1BgCbwNIr20o3lw9AWQAX45VqIbvbxpnWiegQvy0HmmWxc8F6SseeF72MWnJ8Y0j2y2FlH74Mlq7RIyBdfzYJdj
X-Gm-Message-State: AOJu0YxizoqMYDi8Ih0AifBNHwmZ4YXeXYPJlYVt/U99ZR1y9mQBcGSg
	UIgcGlRTE1cE9zYaBZf5kaSm+Gl0mJdYjhrd7KO1ierH4d5fL0cRYJ/XJWxqL2LHvNtUCvMfysx
	lbtOm9c/vKAD8iDqXRdIre+uSmFaz1RTF2jcB0+T0FiRVk0jO1gTq+DHkMQ==
X-Received: by 2002:a50:aacf:0:b0:56d:c748:4792 with SMTP id r15-20020a50aacf000000b0056dc7484792mr1315034edc.41.1712917846138;
        Fri, 12 Apr 2024 03:30:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkEj08u0jhsaBiLq2gJ5iaSwg1hRyq0JX4uJKAZy5zNLBvql9CHV4qtD3Y6ko6NuXjiwYZRA==
X-Received: by 2002:a50:aacf:0:b0:56d:c748:4792 with SMTP id r15-20020a50aacf000000b0056dc7484792mr1315022edc.41.1712917845779;
        Fri, 12 Apr 2024 03:30:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h17-20020a50cdd1000000b0056fede24155sm1172037edj.89.2024.04.12.03.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Apr 2024 03:30:45 -0700 (PDT)
Message-ID: <818a4319-bec2-46b5-8771-5d34236b351c@redhat.com>
Date: Fri, 12 Apr 2024 12:30:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL v2] Intel Image Processing Unit 6 firmware
List-Id: <linux-firmware.lore.kernel.org>
To: Bingbu Cao <bingbu.cao@linux.intel.com>, linux-firmware@kernel.org,
 juerg.haefliger@canonical.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
References: <Zcx8i978Bx7QRSNJ@kekkonen.localdomain>
 <484e0f05-3332-4b97-89b7-74406677ed0f@redhat.com>
 <279f3b2b-701c-333c-e699-74225b4858df@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <279f3b2b-701c-333c-e699-74225b4858df@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bingbu,

On 4/12/24 8:08 AM, Bingbu Cao wrote:
> Hans And Juerg,
> 
> On 2/14/24 4:51 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 2/14/24 09:40, Sakari Ailus wrote:
>>> Hi folks,
>>>
>>> This PR moves Intel IPU firmware files under ipu subdirectory for easier
>>> packaging. WHENCE is updated for IPU3 ImgU firmware links.
>>>
>>> since v1:
>>>
>>> - Rebase on the Gitlab repository main branch. The one in git.kernel.org
>>>   was not up to date. :-(
>>>
>>> Please pull.
>>
>> Just a quick note for the linux-firmware maintainers, no compat
>> symlinks are added for the ipu6 firmwares since the ipu6 driver
>> is not upstream yet. So we can just make the driver use the new
>> firmware paths before merging it upstream.
> 
> We are planning to submit a change to add the compat symlinks for
> IPU6 firmwares to support the downstream driver.
> 
> Is it fine for you?

IMHO it would be better to modify the downstream driver instead.

You can simply make the driver try the new path first and
then fall back to trying the old path if the firmware is
not found at the new path.

Regards,

Hans


