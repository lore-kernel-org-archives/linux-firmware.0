Return-Path: <SRS0=ziTW=KG=redhat.com=hdegoede@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B70C54E41
	for <linux-firmware@archiver.kernel.org>; Thu, 29 Feb 2024 14:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B8A6C433C7; Thu, 29 Feb 2024 14:47:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8193C43390
	for <linux-firmware@kernel.org>; Thu, 29 Feb 2024 14:47:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8193C43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709218068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qha7pOvFi/Butcb4dEA+Sult4jw8NetsF6y4Jq4SYdU=;
	b=gXcvrw7fK+r5lGQg7CB6tofMgQcJKhogkWIoPsTTNO8xqzZ9BH5APdN9+8+7etJraexlQB
	PcYUtMUZnzPT/g+ZXSNhlcmLwbKwpDgPpMfODzEYPLGyBjinh3L8smh2pEHWEw5KXuX7D+
	i2WHlBzBUdoI0/wcOVVvkF45gUrNIEg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-tgNfih9dOgaljJf-dcyPHQ-1; Thu, 29 Feb 2024 09:47:47 -0500
X-MC-Unique: tgNfih9dOgaljJf-dcyPHQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a445a83754eso30746366b.3
        for <linux-firmware@kernel.org>; Thu, 29 Feb 2024 06:47:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709218066; x=1709822866;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qha7pOvFi/Butcb4dEA+Sult4jw8NetsF6y4Jq4SYdU=;
        b=tAr1lWPIIULIcGkdRLGqhly1fZWmjZsp0FslxJ1E69Jv0BhMkvQxh9SI/0GSRq05uM
         8TbHV8kBYT9sW75DFHpxwMQyl/jji7+Y3UIgURbyvT4Crd37PujUmmK3R4di6+LYL3Nr
         USfFYSnKscWZ7a4JHTMMebAjQkMsY5gXiKlnTcUkUaxlGuBxHgIpqG2rsr4mGfX2idmo
         xquogt4yGQm2Gsv39EgkAF/Uen+7xnLLnsxHF5+SEsV+BgPH8KjdtOvNbcL3sLbGUuLo
         pVbOl7KgSOM3Ux/I8pdWQ08JndpIp1ItXipIrzMnDydVew6+c+Ot2/rXr1PQMC+Xesko
         rm9w==
X-Forwarded-Encrypted: i=1; AJvYcCVfX47EtmIXbXiD1zN8cCXfW/2ogG0xe1q5OFTvMoqP3NjRx/8a0QKNPXNLhByPa41DhQHKPwvPD/7iqpZPbs2OVKBSGSoWSFfk
X-Gm-Message-State: AOJu0Ywh0P+P10ePfedOwvgqTAZj7vMrh5la59pQwuKkvW/fBoDAtXXw
	v0wXaK2kNSHKyvE8S5ZKRnhKgalkRrituf64/4liiM+Ildt5c4GVkZSyZLgTKj4vf6Sj2ZXqDrV
	zg7fE70J6eGPv3bCboTIlkm86lBpVbhljlQtzgNsZmSfx1SQN3geAaC0VB9a6Uz0idg==
X-Received: by 2002:a17:906:3c0e:b0:a43:2255:17a with SMTP id h14-20020a1709063c0e00b00a432255017amr1741646ejg.7.1709218065920;
        Thu, 29 Feb 2024 06:47:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd01XMJ+m4fIb/HoUdwzbyxVJj9ihqQ4rATB0P573us+r2OLT36hzlSPl+jroc0/8hWHYe5A==
X-Received: by 2002:a17:906:3c0e:b0:a43:2255:17a with SMTP id h14-20020a1709063c0e00b00a432255017amr1741626ejg.7.1709218065493;
        Thu, 29 Feb 2024 06:47:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id el12-20020a056402360c00b00566a3c2dc82sm587366edb.31.2024.02.29.06.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 06:47:45 -0800 (PST)
Message-ID: <e9b7aa7c-04ed-4373-8935-07e45e58ee9f@redhat.com>
Date: Thu, 29 Feb 2024 15:47:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Intel Image Processing Unit 2 firmware
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-firmware@kernel.org,
 Bingbu Cao <bingbu.cao@linux.intel.com>
References: <ZeCGEN8PgbkY3k_g@kekkonen.localdomain>
 <ZeCP1y5RZXAXBTEB@smile.fi.intel.com>
 <0224ee42-d13c-469f-8bb9-7367fea54db5@redhat.com>
 <ZeCXnteuUAByCveF@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZeCXnteuUAByCveF@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/29/24 15:41, Andy Shevchenko wrote:
> On Thu, Feb 29, 2024 at 03:17:26PM +0100, Hans de Goede wrote:
>> On 2/29/24 15:08, Andy Shevchenko wrote:
>>> On Thu, Feb 29, 2024 at 01:26:40PM +0000, Sakari Ailus wrote:
>>>> Hi folks,
>>>>
>>>> This PR adds firmware files for Intel IPU2. The atomisp driver that needs
>>>> the firmware is currently in staging.
>>>>
>>>>
>>>> The following changes since commit fe0274513384acb3be3756ae17da97f551a1e0e7:
>>>>
>>>>   Merge branch 'robot/patch-0-1709160821' into 'main' (2024-02-28 23:13:23 +0000)
>>>>
>>>> are available in the Git repository at:
>>>>
>>>>   https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-firmware.git tags/ipu2-2024-02-29-2
>>>>
>>>> for you to fetch changes up to 28fbeb4f8b8cf5fa214eeaa93c83d4ee779d7a5b:
>>>>
>>>>   Intel IPU2: Add firmware files (2024-02-29 15:24:23 +0200)
>>>
>>> I can't find the respective LICENSE file. Where is it?
>>
>> The license file is here:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/LICENSE.ivsc
>>
>> And Sakari's pull-requests is based on the very latest linux-firmware
>> code from: https://gitlab.com/kernel-firmware/linux-firmware/ which is
>> the canonical source now and the kernel.org repo is a mirror of that.
> 
> Hmm... I don't understand, but when I went to the repository via Web UI I
> haven't found the respective LICENSE file.

It is there, but the directory entries are sorted in some weird order,
so the LICENSE.ivsc file is near the end of all the LICENSE files,
no idea what is going on wrt the sorting ...

Regards,

Hans

