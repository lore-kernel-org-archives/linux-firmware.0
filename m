Return-Path: <SRS0=ziTW=KG=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31065C48BF6
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Feb 2024 14:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DED6CC43390; Thu, 29 Feb 2024 14:17:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D83EC433C7
	for <linux-firmware@kernel.org>; Thu, 29 Feb 2024 14:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D83EC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709216250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=60o8KsvcdcbMaUetzi9Oq08nT2uVzrQzp7hTiK7Eoho=;
	b=YC/bvANlTnx92myOxriVZDwpDWrkaYC7pzRrDvB4qLhmNoj1uQ9DilpZmQEgsZ66S1hooN
	FaCGvRjXRhQogLusl2tN9150ni+YyDkJZEoVMExo4rEYFAQ/aVMkKDegyjKAJmrDuQqO8d
	TEgGCclZZ8e4HSqCojazqARXsTDckiw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-Lp2c2R5hM1qeuZKPvbSEPQ-1; Thu, 29 Feb 2024 09:17:29 -0500
X-MC-Unique: Lp2c2R5hM1qeuZKPvbSEPQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-56451e5801dso829349a12.3
        for <linux-firmware@kernel.org>; Thu, 29 Feb 2024 06:17:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709216248; x=1709821048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=60o8KsvcdcbMaUetzi9Oq08nT2uVzrQzp7hTiK7Eoho=;
        b=Nl60pQFOU1k4ZdAJJHvaoIjNZFvCZxtdB20MEkI5X+RIYvqVDHsExRAa6Ivu8qLYFX
         YD8v1j/Bydkbh4Xa4gMEPSSd/O8Msd99Wkt1WBuLStAgJqcJAZs1n3OFB3KBy0toeYfG
         HbZHyT2xwhmqylJ8+3yfGKBZsPO+oiZFiWJpO4HpxNynuzsr6li8GROKnP2TaCCnnD7A
         pBXV75UaDJqJQfL/vczLifs8n57jZlF3dDDY4KcWGQKoHu/Z3JKESaJ6cpbhLAjr9uyN
         YCGYlv2QdztDO+fPp0M8QUxRwiQwSvYjQWQHFLv4c9tPzbyKCSyE/QLS3R8cccKK7/O0
         uaZg==
X-Gm-Message-State: AOJu0YwI7Rr2WKjNmN4nviDkppyo2/ybKhxZjDiR9MvsNvN2I7kcoTSr
	JsY63bDM84DdrwxeFFSxIv2vrfCdg+LTk2N5V21w71ZUuEFJU4vkAmdO0sy1j4t5tUksnzNtwJa
	tbeG5CsKEuNUkYE5ja4+3+qf65S7cMqXl2o1Db7gCGDPIQLOxT+JhDFAusQ==
X-Received: by 2002:aa7:db48:0:b0:566:be37:47c2 with SMTP id n8-20020aa7db48000000b00566be3747c2mr87975edt.12.1709216248026;
        Thu, 29 Feb 2024 06:17:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLOotuGjUF7x1/OolG3w595+1EMSIJ15LbDpu4mnu/EhUl1WLWFDpBlVREpY9TyTBY5RIuVA==
X-Received: by 2002:aa7:db48:0:b0:566:be37:47c2 with SMTP id n8-20020aa7db48000000b00566be3747c2mr87957edt.12.1709216247627;
        Thu, 29 Feb 2024 06:17:27 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id s9-20020a508dc9000000b005651ae4ac91sm647500edh.41.2024.02.29.06.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 06:17:27 -0800 (PST)
Message-ID: <0224ee42-d13c-469f-8bb9-7367fea54db5@redhat.com>
Date: Thu, 29 Feb 2024 15:17:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Intel Image Processing Unit 2 firmware
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Bingbu Cao <bingbu.cao@linux.intel.com>
References: <ZeCGEN8PgbkY3k_g@kekkonen.localdomain>
 <ZeCP1y5RZXAXBTEB@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZeCP1y5RZXAXBTEB@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 2/29/24 15:08, Andy Shevchenko wrote:
> On Thu, Feb 29, 2024 at 01:26:40PM +0000, Sakari Ailus wrote:
>> Hi folks,
>>
>> This PR adds firmware files for Intel IPU2. The atomisp driver that needs
>> the firmware is currently in staging.
>>
>>
>> The following changes since commit fe0274513384acb3be3756ae17da97f551a1e0e7:
>>
>>   Merge branch 'robot/patch-0-1709160821' into 'main' (2024-02-28 23:13:23 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.git tags/ipu2-2024-02-29-2
>>
>> for you to fetch changes up to 28fbeb4f8b8cf5fa214eeaa93c83d4ee779d7a5b:
>>
>>   Intel IPU2: Add firmware files (2024-02-29 15:24:23 +0200)
> 
> I can't find the respective LICENSE file. Where is it?

The license file is here:

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/LICENSE.ivsc

And Sakari's pull-requests is based on the very latest linux-firmware
code from: https://gitlab.com/kernel-firmware/linux-firmware/ which is
the canonical source now and the kernel.org repo is a mirror of that.

Regards,

Hans

