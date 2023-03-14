Return-Path: <SRS0=9nQd=7G=gmail.com=chunkeey@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174C9C6FD1C
	for <linux-firmware@archiver.kernel.org>; Tue, 14 Mar 2023 12:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D320EC433D2; Tue, 14 Mar 2023 12:59:51 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3924C433EF;
	Tue, 14 Mar 2023 12:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C3924C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id x13so14361001edd.1;
        Tue, 14 Mar 2023 05:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678798789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vOvlS9sNnIAgMeiZIPQKbYtFPVSiHJBUwPLfTIY6Uq8=;
        b=l/GMyLsSNlEI1ncXHpAGoyfpP8t/0JsG2vUswVrn3T6jLx/ClNO00bRJuRZCHFjnRf
         jp0cp24Y3yimd7t/ajg+yyhdSaQLd0RhmqTuzPnBFVzw/MmN1erFp58bZNVP0f2qzsX7
         LlovXuQ4fYxUoUXbhFvY2lO73attcWOI6UORg+JIO0Xa8RwC6xi28ZFHNHvrH5IH90gg
         9FT72cu7hIkDMv6UYNuJ2PZj2O3KBe9+Qab3XEBUTlYEToPbRmfMIftmSQ3UbLnOphjJ
         I0B9+tjxUmHWN4wm0FtNd2Tcwn8B+aDT4PtKt2IYlSLZha5tAIqIoctoN4iXM+5pKc0/
         kkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678798789;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vOvlS9sNnIAgMeiZIPQKbYtFPVSiHJBUwPLfTIY6Uq8=;
        b=RwDq6qto9we2TjVNHvR8A2C4T8dkqetBCuG0aTWkzhAWr+hgKFnkOK8KpFoVBLxC6w
         lctwYto4mM3nJIYBbcBfbMi3U2ImgErrJJ0D9jFON4Chw6sXRN22EbawEJb0us/uCr60
         agFzfcLYmexRHJ6cGj/Wbevi2Fy8mZ5XQDfkEPfzSWgV9kWEm5lj7RD9fWWkcftmF58v
         YlJiOcbbFH3ff0b48FrGWucdYFhzzrOGs1TqGner3Tu5Hb7gNXl7xZAwrT6bifDqyHPm
         JZrtD3Mnf53QAW2gahax0DgqSamBNKzV73+/YGbnt+fbjp3lnCBvVOJgJuNRV7vccZP7
         zpUg==
X-Gm-Message-State: AO0yUKU4Xyg5f12nSHzFGPVq6eJGT+qnsJrxkHfDd7h6kn4OR8hSOeQl
	etYXX2Hj6KYS+q6fSppVB6s1cbnrKwY=
X-Google-Smtp-Source: AK7set8PFmSkHtNOh7s02YAOdDNYllsLU9pj8pSCnyBE/jBVSNveBkc6BoztdE8/F9AuUBqUpsutfA==
X-Received: by 2002:a17:906:6150:b0:8df:8381:52f7 with SMTP id p16-20020a170906615000b008df838152f7mr2368916ejl.17.1678798788783;
        Tue, 14 Mar 2023 05:59:48 -0700 (PDT)
Received: from shift (pd9e2911a.dip0.t-ipconnect.de. [217.226.145.26])
        by smtp.gmail.com with ESMTPSA id y4-20020a170906558400b008bfe95c46c3sm1106256ejp.220.2023.03.14.05.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 05:59:48 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift with esmtp (Exim 4.96)
	(envelope-from <chunkeey@gmail.com>)
	id 1pc4Df-0005AQ-2T;
	Tue, 14 Mar 2023 13:59:48 +0100
Message-ID: <97b7f35c-f7c9-1257-ff67-e5b61efe0ce0@gmail.com>
Date: Tue, 14 Mar 2023 13:59:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
To: Kalle Valo <kvalo@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
References: <878rgzuw37.fsf@kernel.org>
 <c9ccbfe1-9535-f46c-756e-4eb19c1afbff@gmail.com> <87a618517g.fsf@kernel.org>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <87a618517g.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/20/23 06:56, Kalle Valo wrote:
> Christian Lamparter <chunkeey@gmail.com> writes:
> 
>> On 2/15/23 10:17, Kalle Valo wrote:
>>> Here's a new pull request for ath10k and ath11k. We have new hardware
>>> IPQ5018 and various updates for existing hardware. Especially many have
>>> requested the firmware update for WCN6855 which seems to fix an
>>> important suspend problem.
>>>
>>> Please let me know if there are any problems.
>>
>> Could you also please include all the QCA9888+IPQ4019 boardfiles updates
>> from last year too?
> 
> I will try to go through them later. The problem here is that I don't
> have much time for ath10k nowadays.

Ok, should I just post the board-2.bin updates to linux-firmware?
I have them ready to go for IPQ4019, QCA9888 and QCA9984.

Cheers,
Christian
