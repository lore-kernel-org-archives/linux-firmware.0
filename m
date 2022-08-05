Return-Path: <SRS0=qzet=YJ=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E820C25B08
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Aug 2022 20:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 39625C433B5; Fri,  5 Aug 2022 20:35:16 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12A3EC433D7
	for <linux-firmware@kernel.org>; Fri,  5 Aug 2022 20:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12A3EC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id d14so4866557lfl.13
        for <linux-firmware@kernel.org>; Fri, 05 Aug 2022 13:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=nEs1T+9g6EOckZLPnIrdTfnKnh7WKsJdS1IqvtqzCCo=;
        b=aju/Min+FNvd6MGHQl3ZhpbhXqUw75B+9M+tE/2N7/uF2PFX8BdS8Oz4K6ycHLuAu0
         VNVA+rvfLt6aBpDSAddqEqMDdA2f+SnuzX4cRKX3Lo5chWqJMZsSD4nHC036VbAtdz/n
         HG//CawrK0RA0C+WbdK6U0gFEtR/eWEsSNxutbmgYdiBaGWlCLlWV7xT4bqlG77upLvi
         EuX8PLEBhYHo8DUVzwlMDoVmcAcLxa+92Dnwgwa+zrDdh8BN9MzjfDXWwm4mFoeGW4wn
         i7T0GwxTJLUI+h0ObrUjxyL9BueIHTzr2h1kY+Vm6Bz7Fa6iZRjXrdSeCeAw0G3h+LcD
         mwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=nEs1T+9g6EOckZLPnIrdTfnKnh7WKsJdS1IqvtqzCCo=;
        b=w39SOPbF7eoQPGVXO2m+5YRuPsCY2EOn2yNyFwXdyBWdB7tJsX0Wv+wIvC3Jr70s2n
         LwlV+mmsfDjcBsHxcZZjjvNDJgSOacgiBxaFfFAnaY13witQA1NPyR+1Lze7jKjsCdLw
         nriDmop8TFpMJ2aIdsvJeUcw78KtGZtURWnTgkoxRrlXk/TiedbYY5w+2QA4Cxaw8lbm
         5jfgpSFjbc9rWzQ8sA66WhoydFp4VRbu12DBl1/6P0/SdvaSgoBLeCSW40ZZpxD/1Isq
         2wI4ayP8NpeTCodP0hWOd7w4Ta7mfnoJz/OsMZ6EqSmsBchaHosBi4l/T+nmIRSphJxv
         PjAg==
X-Gm-Message-State: ACgBeo3zBWb496E67e68kGr0f+Zsc+PkjPqBluUSTE+rsAQjEGAgb93h
	J9rAEzovkM/pmf1C4yK1y8kVCw==
X-Google-Smtp-Source: AA6agR4TX2+8SBTtftm1b2BwDJfs6bCoS6LwzOGdPX5GT3nTYUN+fOPYC/ADy0ddXk8PDfrnVCLEpg==
X-Received: by 2002:a05:6512:ad3:b0:489:ec0d:761e with SMTP id n19-20020a0565120ad300b00489ec0d761emr3115960lfu.2.1659731713107;
        Fri, 05 Aug 2022 13:35:13 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y25-20020a2e5459000000b0025e0bcd9127sm584846ljd.73.2022.08.05.13.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 13:35:12 -0700 (PDT)
Message-ID: <c1dcfbf5-3bb8-8156-667c-f5966f7ba1d7@linaro.org>
Date: Fri, 5 Aug 2022 23:35:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: qcom: Add firmware for Lenovo ThinkPad X13s
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Mark Pearson <markpearson@lenovo.com>, linux-firmware@kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, bjorn.andersson@linaro.org
References: <9a79936b-70e2-f964-55ac-e2be8e9346ed@lenovo.com>
 <2a4ae0d4-8ba2-a202-0051-6bd7b170bccd@linaro.org>
 <CAF6AEGvdnrPn+rnDGmjza1-xoPaOQgdPLkSfaOL6hCPnB2ea5w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAF6AEGvdnrPn+rnDGmjza1-xoPaOQgdPLkSfaOL6hCPnB2ea5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2022 23:09, Rob Clark wrote:
> On Fri, Aug 5, 2022 at 2:37 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 03/08/2022 23:37, Mark Pearson wrote:
>>> The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66:
>>>
>>>     amdgpu partially revert "amdgpu: update beige goby to release 22.20"
>>> (2022-07-25 14:16:04 -0400)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://github.com/mrhpearson/linux-firmware lenovo-thinkpad-x13s
>>>
>>> for you to fetch changes up to 4ae4ae88918928e15006eb129ad981aa58216b59:
>>>
>>>     qcom: Add firmware for Lenovo ThinkPad X13s (2022-08-03 16:29:07 -0400)
>>
>> Mark, it's so great to see firmware packages for Lenovo laptops being
>> submitted!
>>
>>>
>>> ----------------------------------------------------------------
>>> Mark Pearson (1):
>>>         qcom: Add firmware for Lenovo ThinkPad X13s
>>>
>>>    WHENCE                             |   8 ++++++++
>>>    qcom/LENOVO/21BX/adspr.jsn         |  28 ++++++++++++++++++++++++++++
>>>    qcom/LENOVO/21BX/adspua.jsn        |  29 +++++++++++++++++++++++++++++
>>>    qcom/LENOVO/21BX/battmgr.jsn       |  22 ++++++++++++++++++++++
>>>    qcom/LENOVO/21BX/cdspr.jsn         |  22 ++++++++++++++++++++++
>>>    qcom/LENOVO/21BX/qcadsp8280.mbn    | Bin 0 -> 14367860 bytes
>>>    qcom/LENOVO/21BX/qccdsp8280.mbn    | Bin 0 -> 3575808 bytes
>>>    qcom/LENOVO/21BX/qcdxkmsuc8280.mbn | Bin 0 -> 14392 bytes
>>>    qcom/LENOVO/21BX/qcslpi8280.mbn    | Bin 0 -> 6213632 bytes
>>>    9 files changed, 109 insertions(+)
>>>    create mode 100644 qcom/LENOVO/21BX/adspr.jsn
>>>    create mode 100644 qcom/LENOVO/21BX/adspua.jsn
>>>    create mode 100644 qcom/LENOVO/21BX/battmgr.jsn
>>>    create mode 100644 qcom/LENOVO/21BX/cdspr.jsn
>>>    create mode 100755 qcom/LENOVO/21BX/qcadsp8280.mbn
>>>    create mode 100755 qcom/LENOVO/21BX/qccdsp8280.mbn
>>>    create mode 100755 qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
>>>    create mode 100755 qcom/LENOVO/21BX/qcslpi8280.mbn
>>
>> I think it's the time to settle onto firmware paths for the
>> Qualcomm-based devices. At some point it was proposed to use
>> qcom/<SoC>/device/*mbn.
>>
>> So, in your case it could be qcom/sc8280xp/Lenovo_21BX/
> 
> I don't think it is a good idea.. we should stick to a path that can
> be constructed from SMBIOS fields if we ever want a chance to get ACPI
> boot with acceleration working

Yes, it's also true. I do not quite like the idea that we are going to 
end up with two different path types. One using the DMI/SMBIOS ids, 
another one using SoC and machine id. Maybe we can settle on using 
SoC+id and then using DMI-based links.

There is another point to remember. I can imagine that once WoA/LoA 
laptops are more common, there can be several different DMI models 
sharing common firmware. So, there will be symlinks involved anyway.


-- 
With best wishes
Dmitry
