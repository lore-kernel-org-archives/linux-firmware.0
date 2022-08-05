Return-Path: <SRS0=qzet=YJ=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA11C00140
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Aug 2022 20:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 74A8EC433D6; Fri,  5 Aug 2022 20:45:14 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 491BEC433C1
	for <linux-firmware@kernel.org>; Fri,  5 Aug 2022 20:45:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 491BEC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id z25so4987586lfr.2
        for <linux-firmware@kernel.org>; Fri, 05 Aug 2022 13:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=0TL+KsWEH2gAv2tG32X/aHSElzxPjelb7tyuw0X2ktA=;
        b=hYcV9MvIFC2JU9Eb0aEl0W2IkYnwU0M/7MJe7kNotsxxGb7rzmTAArJIGlnCMEpBFQ
         pPiHQtdxXaV28TAiAVuC81eH3WsPqIGohFcXFukTVvCtZiwIR4hPqK81mDDeKzuWmPf0
         ZlIsGm2RxONfAUwc30AgHv9FIrrmDJ12WY/4kxrAyaLjpMxOInOff4TlhRQKFz1lrEVv
         RVLK/s6DbKoJ5JdBudvbNnT2vKLZ8r7Umm0QVLZ0hz8319frsQSHlFawQLzl07k2CPnU
         DeRUiJSkfnNdDdQEedQZFUbhnubJIsuRhV77SoCuMn2r1GfYnm+vMucrcek5kDIde1yF
         wmjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=0TL+KsWEH2gAv2tG32X/aHSElzxPjelb7tyuw0X2ktA=;
        b=zR5nA0DJSC71IKEuBIfzhLVOyJtveVTlZJanIEDjRHbPQk5AB8ptLWbCqM7ntuLf5U
         b1tfEcIb/ft1FuzggMyQzEDncBmNQcJI//JrHXmpv0GiMAyBhMeHq9w1mPTL2S4uGzEn
         EdbGIiXjB7zOUpbmSJip3r5m1QyvO4NH1tlQCCNkDAB34vwGlsYqu/q+FczgtV6oG/69
         sZYxKN7k2+5Dnv3SaShnMuBDIXq7y0Ljn+vs/2VzmDFmMWpBnc/Z7qq6imue1wxPWtlR
         hicYmgBNHnpJxZBAQ8A4lyi02f4qs3GiDCWS8ScNUUn3DLe+smOw6eAzG+pFcYX63t1Y
         Nl4w==
X-Gm-Message-State: ACgBeo2tys+YDB95WHdBi18DRYHjLvutkCeZUNrhBo6tUB5HBIPqB2rf
	9d5cH0EKLqQytAiyGKoZFJSACw==
X-Google-Smtp-Source: AA6agR4SKWjC/3ZHqelPX+EtvITTb8dtny30WmQp8msYulc0FhmEzXTUMEHh/FlP/5tgK3Y6QM5mkg==
X-Received: by 2002:a05:6512:2306:b0:48b:2905:21a8 with SMTP id o6-20020a056512230600b0048b290521a8mr3101462lfu.167.1659732311209;
        Fri, 05 Aug 2022 13:45:11 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b0048a9e899693sm579825lfo.16.2022.08.05.13.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 13:45:10 -0700 (PDT)
Message-ID: <7cc0f897-1482-5623-2c91-1922a7ceebcf@linaro.org>
Date: Fri, 5 Aug 2022 23:45:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [External] Re: qcom: Add firmware for Lenovo ThinkPad X13s
Content-Language: en-GB
List-Id: <linux-firmware.lore.kernel.org>
To: Mark Pearson <markpearson@lenovo.com>, linux-firmware@kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>
Cc: bjorn.andersson@linaro.org
References: <9a79936b-70e2-f964-55ac-e2be8e9346ed@lenovo.com>
 <2a4ae0d4-8ba2-a202-0051-6bd7b170bccd@linaro.org>
 <c5b97755-608f-48e6-40ae-22095866a110@lenovo.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c5b97755-608f-48e6-40ae-22095866a110@lenovo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/08/2022 15:43, Mark Pearson wrote:
> Hi Dmitry
> 
> On 8/5/22 05:36, Dmitry Baryshkov wrote:
>> On 03/08/2022 23:37, Mark Pearson wrote:
>>> The following changes since commit
>>> 150864a4d73e8c448eb1e2c68e65f07635fe1a66:
>>>
>>>     amdgpu partially revert "amdgpu: update beige goby to release 22.20"
>>> (2022-07-25 14:16:04 -0400)
>>>
>>> are available in the Git repository at:
>>>
>>>    
>>> https://github.com/mrhpearson/linux-firmware>>> lenovo-thinkpad-x13s
>>>
>>> for you to fetch changes up to 4ae4ae88918928e15006eb129ad981aa58216b59:
>>>
>>>     qcom: Add firmware for Lenovo ThinkPad X13s (2022-08-03 16:29:07
>>> -0400)
>>
>> Mark, it's so great to see firmware packages for Lenovo laptops being
>> submitted!
>>
>>>
>>> ----------------------------------------------------------------
>>> Mark Pearson (1):
>>>         qcom: Add firmware for Lenovo ThinkPad X13s
>>>
>>>    WHENCE                             |   8 ++++++++
>>>    qcom/LENOVO/21BX/adspr.jsn         |  28 ++++++++++++++++++++++++++++
>>>    qcom/LENOVO/21BX/adspua.jsn        |  29 +++++++++++++++++++++++++++++
>>>    qcom/LENOVO/21BX/battmgr.jsn       |  22 ++++++++++++++++++++++
>>>    qcom/LENOVO/21BX/cdspr.jsn         |  22 ++++++++++++++++++++++
>>>    qcom/LENOVO/21BX/qcadsp8280.mbn    | Bin 0 -> 14367860 bytes
>>>    qcom/LENOVO/21BX/qccdsp8280.mbn    | Bin 0 -> 3575808 bytes
>>>    qcom/LENOVO/21BX/qcdxkmsuc8280.mbn | Bin 0 -> 14392 bytes
>>>    qcom/LENOVO/21BX/qcslpi8280.mbn    | Bin 0 -> 6213632 bytes

Another nit to consider. I suppose that these files follow the name for 
them on the window platform. Another point to consider is to rename the 
files to follow the usual pattern that we have on other platforms 
(adsp.mbn instead of qcadsp8280.mbn).

But as with the paths, the final decision should be probably in hands of 
Bjorn and linux-firmware maintainers.

[skipped]

>>
>> P.S. Can we hope to get firmware for older laptops to be published too?
>> It would be really great if it would be possible to provide full support
>> for Yoga C630 or Flex5G using redistributable firmware from linux-firmware.
>>
> I looked into this previously for the C630 and was nacked I'm afraid.
> 
> Going back to the older platforms is a harder ask unfortunately because
> along with the FW you really need changes in the boot loader and I know
> I won't win that argument.

Well... We would be happy if we can get redistributable FW even without 
bootloader changes.

We have been successfully running Linux on C630 and Flex5G by manually 
fetching the firmware from the Windows partitions. Getting it into 
linux-firmware would help major distros to support those laptops without 
having to resort to 'read files from Win partition' hacks.

> I'll try again once we get a bit further along with this platform but
> realistically, the chances of it happening are small. I'm (quite openly)
> using this PoC project to prove that we can do Linux on one of our ARM
> laptops and then hope to use our experiences to drive future platforms
> and get it included fully in the Linux cert program. Right now the X13s
> is a trial/test project to see how far we can push it.

Yes, let's focus on getting the firmware X13s in, sort all arising 
questions and then, if possible, use that as a lever to help publishing 
fw for older models. Fingers crossed.

-- 
With best wishes
Dmitry
