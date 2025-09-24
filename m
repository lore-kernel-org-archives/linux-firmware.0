Return-Path: <SRS0=T9qM=4D=linaro.org=bryan.odonoghue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EB5DCAC5B0
	for <linux-firmware@archiver.kernel.org>; Wed, 24 Sep 2025 12:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DCB0C4CEF0; Wed, 24 Sep 2025 12:55:26 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C94EC4CEE7
	for <linux-firmware@kernel.org>; Wed, 24 Sep 2025 12:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C94EC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso6897915f8f.2
        for <linux-firmware@kernel.org>; Wed, 24 Sep 2025 05:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758718524; x=1759323324; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rqmhFOqyL/jn+0ySn6gfhyPKZz2/xOxFYy9KMMhl77g=;
        b=gQl/smqZ7/F0y3v5rMyE/JXN5wmB6FG2Z87OpyAk82b25mMXD0CglBGf6T4dcoK7dq
         7MR2We4/Ape8qfUShf0XulPfug0P/4qDP1TNGX4gkIpFpSQ71QAC+o6KUIfJ6IbcMAOr
         MmhkDeqIwpteKAI4rG3v1FtobXNHpNSL9fPKoqrpq6JsEW5aaqpE8Y9FSQtAupRCHKXS
         21UPVOua3OitMNQQxdPNJNdu6lseXWw1R7hh5tclVWHATgPGZe1OPgvY9ghZSWDRYvLe
         1J2Fc3/JaAD+j+vvQRWUD0lCEgei5577dHBf8cgnMbm0zSTDR/37MS8NSk4kmvC78rdm
         Vv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758718524; x=1759323324;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqmhFOqyL/jn+0ySn6gfhyPKZz2/xOxFYy9KMMhl77g=;
        b=lox3PPzWuFe8eJP5DWmRj+ApkGAmZYmd2no+919uXVj09YOBC3Sj2GX6nMTDQtuCrX
         Jurajp+BHWD61DzDjHIrUE7hGn5u5MBweal8lUafiWV0KiBRjt3nycg38rhXhzdhh07W
         0YlJYv2Q3YsLbVR5V2ldI6QdjRjCIlv1SiMrzA6h1AqMklYzrA9LDtzWOgzTyn86DlSA
         CgtjTi6DLznPciQ0p2K+TxP91XEL54BuDAN76WUEDU21Czrvhp+kTHkox1ytYSwPig7T
         Bb2mSec9UyfZRZnqv04eRhM9wAPZAfKpw3Z6DoJul4tAQpOjIu3il8/GTolOyP+fNReQ
         Wzfg==
X-Gm-Message-State: AOJu0Yx/ktwxEDOjZTZQvQ1tzyryikWyBp6FSfFD/Op1pIcIYKntVwQS
	4Qp9WRxgFHCTc1C5tocaesRAohSKQ3zKQYD4Ah4+RXnglW9Fjn3jObBYwVu69Qc2kfM=
X-Gm-Gg: ASbGncvRLduRZK8DVaXoDPmDL89+F+vgOJZ7zHkcSitbCjXdouAcTKy0XICu/SHqu2n
	vLh+lKthkYUJI81ggY+AhXy8MQBK5TFblcRC8EpNkHnnylvv7+X4VquNeBCz0VKGR1Pusj/Rxpi
	IuG3VUTM+PBkL+klwuUjbiAOnp4RUNKjKv9DpsmKr4iT+WVdu9wyKFCr5Ectyv4m2/iQjyYlk3T
	0NbPa/Xhm4juXhZuXA6em1Ly2CIICvhXnUvx+uPR1jhcfZJdjdsFeJR/9RWjnS+z+9LvvoxSX7W
	rENyZF2QlcUOQXpnb8Q2PCWimKcag36a+wkRQXN3Uo6rcAFgE/St6MiziH7TUAeD9eywwQronmc
	4DKSKsbzQb6YUBTqJVWWQu4mz+8zMEXCTS+P2lwXxbDXeNu7b4inJYKpFfMQ0n7XpeJ77QhShuK
	7A1EZsj7J9exuMxSctYH31
X-Google-Smtp-Source: AGHT+IH9718UuPsUK5u6R5hy08pX7IR2e1ms5hjKq5Yk/4EjPOc8rqGkBmfzSKvfGCHCWlsehtpUnQ==
X-Received: by 2002:a05:6000:2406:b0:3ec:a76e:95d6 with SMTP id ffacd0b85a97d-405ccbd713fmr4359848f8f.55.1758718523662;
        Wed, 24 Sep 2025 05:55:23 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e1ce0f87csm37971815e9.0.2025.09.24.05.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 05:55:23 -0700 (PDT)
Message-ID: <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
Date: Wed, 24 Sep 2025 13:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
 "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/09/2025 11:43, Dikshita Agarwal wrote:
>>> I understand your concern. To clarify, we are not removing support for the
>>> existing Gen1 firmware, so backward compatibility remains intact.
>>>
>>> We are simply adding support for Gen2 firmware for this architecture. As a
>>> result, QCM6490 will support both Gen1 firmware (with the Venus driver) and
>>> Gen2 firmware (via Qualcomm's video driver [1]).

I agree with Dmitry here.

Its not possible to disjunct upstream HFI6xx @ the firmware level 
between Venus and Iris because the DTS would have to point to a 
particular firmware depending on which driver you wanted to run, which 
would make the DT dependent on the driver, which is not allowed.

>>> Additionally, as part of our plan to transition all Venus-supported targets
>>> to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1 firmware
>>> to maintain backward compatibility.
>> Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
>> interchangeable for the hardware they both support, until the venus
>> driver drops support for V6 hardware. At that point it's expected that
>> there will be no V6 support in Venus driver.
>>
>> You can not simply upgrade to Gen2 firmware as if nothing happened.
>> Consider a device node on SC7280 / QCS6490 with the firmware-name
>> pointing to OEM-signed firmware. Both Venus and Iris drivers would
>> happily consume the device node and try to work with it. One will work,
>> another one will fail. This is definitely not what we have agreed upon,
>> when you started adding Iris driver.
> @Vikash, could you please chime in?

It would OTOH be possible _only_ release a HFI6xx Gen2 firmware for a 
new SoC that doesn't appear upstream yet but, that's not the case with 
7280/6490.

---
bod
