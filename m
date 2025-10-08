Return-Path: <SRS0=2mr0=4R=gmail.com=technoboy85@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF3BCAC5BB
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Oct 2025 13:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 19CEEC116B1; Wed,  8 Oct 2025 13:12:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 542E5C4CEF4
	for <linux-firmware@kernel.org>; Wed,  8 Oct 2025 13:12:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 542E5C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so71218945e9.2
        for <linux-firmware@kernel.org>; Wed, 08 Oct 2025 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759929135; x=1760533935; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qc1+9X3nEr2WNeOTdZVDz45D/LQvZyp8mgMOhKpaByA=;
        b=eTywb8fz6HDh9yEyeCvHwjKiRIVHAkD8DYPVAvhT6eRc1O8B0SZndVHj9pmm7Mq109
         a7qwYne0PxsS/nf1fODDOhh9xpSfBAn6Miqzq2+pzlp2LzroA3RMaw5IyXQ5D8XSnu4Q
         S6VkjEoOSFauULOsjPcV6wqU7qf7TvZZE2N9ltE+xS3DEGQqn4yX+Fz2jWJKM67b6O3i
         6RoO9fTutiy/3kXOdh14RBtvX32X26EQ+2GvLdqCZzhznMdvyCuomRBAuBhRQv38DLi1
         NP9SpFJAYDQj2uxRcGWlIchTduhMcxdo5Vgvixgt7mJGpPIpDlsjFtuX1hQFI7IclO5g
         rYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759929135; x=1760533935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qc1+9X3nEr2WNeOTdZVDz45D/LQvZyp8mgMOhKpaByA=;
        b=cUd6X+XX8npTi+nOSzJkTbuDMuhcSdV37FRlZYI1D53TsFwapXa5C/8Mc+X+n60slD
         0CiRUjhPKN2ZRSoMymJQm8RjtGoobg3E2DxnEn0lin1GkAts/HlcXfmnocWMV8PHoNHH
         ngntoqQyHpO4mc0E784h+Nm4VWv2I1t8h9xhJu+C1bk72efU91VAxLtWTjMD9HM1FdHe
         O6le3LS8PFWwzQclNfecn2cjQ+tT8qyLMHDen08+A8httqOu3nxtc8FGWga/1QPnqvZc
         3hYWWRLJ7Vg9vR3BWlOVU27sleTWyPfSr4iYeMERup3wWNQ+OuFytZuAyxWu6udt6KM6
         v4Rg==
X-Forwarded-Encrypted: i=1; AJvYcCV2Sgc9iGlbxlVnZbmizhzrLdnZ5OOJxcs/y5eKUaWda+M1efU/tYUoF9OBahJfvq7Zw39Gdb9z+mHC0q4h9w==@kernel.org
X-Gm-Message-State: AOJu0YxlDl+s27liYCbYrQzwH77lK11dAmE/CoPGl6x6M5LPYJdALwhA
	IJZTRQHQy61BiXNbiTWwQAuIEgTl08JuQFaqcAOnLHwT2DMWarSf7M0M
X-Gm-Gg: ASbGnctuL4shCu+IWTJZgFGS9kk7EIHJZXgjM3IDxKnivuExguNUsHFMvy+lfbH+V+R
	8Dwkli4/6CXJRYEVsWfK3fTsq16Ql+TJXQbrXclR9jWywSHBhSlcYsxlQmIbM0G2d00zO8hlfbF
	y5nJ5lST1HLl7FP5s4ecx0Tbjpk4YrYiZE7EswWn7dMutwOijvI/+gpNzrDnAnjNUo5uV2KWuRb
	wS4w0iQB48pWiwAGhwyi8+iNVgG0ZgeXOqHMac/7taHEwMwPZZqvKhBUKnnzI+Mfpr8EWpevCvG
	E6DMM5OTBVHyHz0yOzLYVv39IiZbGvErG2TFkVsFU1yb2UiJRUi7zDJPx+Xps/735RgU7CjlV/D
	xTAPZ8rukX5Mkz3+9EE0g69aenqTK3dXBCUk1aNvR7KEe32Yh6QlefuFgbehMjyPU9N4o417Ydq
	oC56IKfYBsmv05g3FGksKrJA==
X-Google-Smtp-Source: AGHT+IG22PFjiN1NNDmZTXxfAAwuCghTytfGJ5ZjD4UTCsjmtKsGg+54Ln7d7u7uXlzxgdmUFId4DQ==
X-Received: by 2002:a05:6000:26c2:b0:3e1:9b75:f0b8 with SMTP id ffacd0b85a97d-4266e8dc01amr2094999f8f.47.1759929135382;
        Wed, 08 Oct 2025 06:12:15 -0700 (PDT)
Received: from [192.168.85.4] (net-2-32-43-137.cust.vodafonedsl.it. [2.32.43.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9bf8295sm37533375e9.3.2025.10.08.06.12.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 06:12:14 -0700 (PDT)
Message-ID: <d0a06fe1-abd0-49b2-8867-6c01d6551e54@gmail.com>
Date: Wed, 8 Oct 2025 15:12:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression in linux-firmware-20250917 for mt7921e driver
To: =?UTF-8?B?QWxsYW4gV2FuZyAo546L5a625YGJKQ==?= <Allan.Wang@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "sam@gentoo.org" <sam@gentoo.org>,
 =?UTF-8?B?TWluZ3llbiBIc2llaCAo6Kyd5piO6Ku6KQ==?= <Mingyen.Hsieh@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "xiangzhedev@gmail.com" <xiangzhedev@gmail.com>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>
References: <87bjn6fgr6.fsf@gentoo.org> <87a52n1xvv.fsf@gentoo.org>
 <dda63a6b723d31f41e6e275ac7f38d31c6715fc8.camel@mediatek.com>
Content-Language: en-US
From: Matteo Croce <technoboy85@gmail.com>
In-Reply-To: <dda63a6b723d31f41e6e275ac7f38d31c6715fc8.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 22/09/25 10:24, Allan Wang (王家偉) wrote:
> Hi Sam,
>
> Would you please try "insmod mt7921_common disable_clc=1"
> to help us clarifying this issue ?

I confirm that disable_clc=1 fixes the issue:


[    9.390667] mt7921e 0000:01:00.0: enabling device (0000 -> 0002)
[    9.406941] mt7921e 0000:01:00.0: ASIC revision: 79220010
[    9.489525] mt7921e 0000:01:00.0: HW/SW Version: 0x8a108a10, Build 
Time: 20250903123148a
[    9.524024] mt7921e 0000:01:00.0: WM Firmware Version: ____000000, 
Build Time: 20250903123243
[   10.611659] mt7921e 0000:01:00.0 wlp1s0: renamed from wlan0

What is this setting doing?

