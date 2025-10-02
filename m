Return-Path: <SRS0=cnmb=4L=linaro.org=bryan.odonoghue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5D4CAC5B8
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Oct 2025 15:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F0CDBC4CEF4; Thu,  2 Oct 2025 15:07:41 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06DA6C4CEFB
	for <linux-firmware@kernel.org>; Thu,  2 Oct 2025 15:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06DA6C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso1001279f8f.2
        for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 08:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759417659; x=1760022459; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GxfinuLeRMqYDBdXF3QccjMF7z8zuMYOlZjx2g41Lkw=;
        b=d6mhmgu2mmziDD9BoIZKGJcGYo7lo0ep4tOeGwg+HuDwVvYOIwoyVLJlKjo1rocArM
         NM41hNcsjDmCiFvwJBkqHssvz7sl0r08u8QQKOjsMv6p3J3CeIcCwgq5yvNiFw4Ja4Xf
         ar3n0TqUELQiiN+lEIiYrcqFZIt76PclnRacGcqFLnnrTA4W85aRy/KfRrscVfBNZP9L
         pVFG3qvXHPMNeTSFQ590QAq/lMJEwy92a/IUKErffQYQOqnZcZgpMAjiFrYKXneANDg0
         VuQeWUhLuQ88euoIY9f84lmOpdw6kmpvhxxQ3SeRAFdqf1A7+o0/AvEkkhwFQwtzv1Rz
         EEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759417659; x=1760022459;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxfinuLeRMqYDBdXF3QccjMF7z8zuMYOlZjx2g41Lkw=;
        b=uV8lgxtfhcbFaDXJe/5nx3Jvx4N39u+O5oPzxkQLw+5dGZhbCZ0iBHqyxBPjOdRWkV
         gLvie7iJyWKVBdmhLpdX30WSnZN8JXa5Kphik7+b73o06/hS9EvBV02zS0c++DjuwLRh
         dxQfMvcBCfiKK39RcId5VhuUyVn9/8auHQaRFQtH2fH6WtIfpSYFp4qkGSYDPCoJBtNp
         DK/JBqmgdJ1HbPjxTUWXLXrzHsQIjAmErbf33adc/T1hSB67B0hH1A+a+Fz2e6PagTVE
         pqHhWw04qVQVBmwhcCGLlAzcivzKPLar2TEmgRwVZ1/JEp/KHzqA1kaOBkNgx6IAF99t
         rmjg==
X-Forwarded-Encrypted: i=1; AJvYcCVVRTpNR/++6NXCpcxCJffw2rcFDYlsGo+MXD6ocYUykuPwDOKP3LzZQpCl37e1WpgcRUPHMEh/36T2KpvwVw==@kernel.org
X-Gm-Message-State: AOJu0YxtTjZN9vELS+Ho4g6dOrIkIck/HkuMOSr95PHOPPH04KJzQjMy
	8im8FESLf3P9adWTlKXhWposPHiDEhj2fKfglNsTZTaWY3UKBPG0lKHfxl1MsVhjugM=
X-Gm-Gg: ASbGncse/IfV7CKdyhRn6U0xLjLmK/kAnLUBN0vv2fzqgH1RykbS1ak4GGtCg8OdEyI
	KcCLL67HO3Rh7QbM91nYdunrRQyTxeafFvjcqV2Iv7/XyWycBtTCAR2TujJuZwjyR5L/kpFHHNl
	lFu7nRWKcAEKCUs+C/dChPQCn/50aiVoqNs7jsap+EttKCFF4gEYJQvlSwKJNf72/xU5A9UVBAn
	BIoNtGpnoemHysXtHor9UDGuGRipzkasrHUai6wohm2c9Za4I6a+gc+b8YaafUYOO/kCISUpBEw
	jui69stkRubYqfrEY4EpT5hZqu5EA7I0BiZOsGzEDZVxniUpDGc9aOLyKjY+Ut1+tE3Su6nLHja
	TBwomMjojgrS6a86hWYR7FPUyTzfvtgKJN+KCNuZPi4GgsWOMW4kGDp+efn0F6PQ9o/bDA0LkuP
	16SlWf6xx6hI4wZwZ5
X-Google-Smtp-Source: AGHT+IE7BF7Zob8VWImYE4jXaFtZGfHFdsSA4ziHHrbd1qrmktLS+xhjYgOnbKcchHYcVyfcNqs2jw==
X-Received: by 2002:a05:6000:2c06:b0:3ee:1461:165f with SMTP id ffacd0b85a97d-42557814772mr4929959f8f.31.1759417659262;
        Thu, 02 Oct 2025 08:07:39 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e693c33adsm37332995e9.18.2025.10.02.08.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 08:07:38 -0700 (PDT)
Message-ID: <b7623cb3-07d6-49be-a8d7-f9512f3cb6ef@linaro.org>
Date: Thu, 2 Oct 2025 16:07:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org,
 "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <k4al7vwl4qruiv7olqlj3qe4gah6qrboyzsbnvfarlgr3amili@wjmkthnxsgmf>
 <7933f6e4-e8e7-4d35-9295-e6b91adcc128@oss.qualcomm.com>
 <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAO9ioeUXsb9UisWbc763-2SvU_-2Ce7qmQ27Wzwt-fWSzHBAeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2025 15:59, Dmitry Baryshkov wrote:
>> * Iris could be then taught to expect vpu_whatever_gen2.mbn first, and if
>>    that is not found, attempt to load vpu_whatever.mbn (for the gen1 intf)
>>
>> WDYT?
> Well, I think that potentially complicates the driver by requiring
> support for both HFIs for the same platform, it requires detection,

Doesn't have to be anything more complicated than a reserved string name.

BTW you're right the main reason to support this is - in effect - ending 
of support for gen1 firmware.

But then in reality if that is the direction of travel, its in the 
interests of upstream and users to make the transition.

---
bod
