Return-Path: <SRS0=1Xq3=EW=linaro.org=srinivas.kandagatla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA59CEB8FC0
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Sep 2023 12:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6EC52C433CC; Wed,  6 Sep 2023 12:55:31 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D1DFC433C9
	for <linux-firmware@kernel.org>; Wed,  6 Sep 2023 12:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D1DFC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c06f6f98c0so28481905ad.3
        for <linux-firmware@kernel.org>; Wed, 06 Sep 2023 05:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694004929; x=1694609729; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K/4hkBYyJ5Fo8pHsHiL3xt5mZBV889/2jclxebFibyE=;
        b=H5eLYtAeBaq+3Aw3DAKUBhrq2psqVzvfV6rlCIWahXKNJGmyychaVeAFSqKDpxgYye
         5uie9DXu6qDVObqRs64eOUGlLLwaGF7qN8yK5FzAN1hCdPv/GwlFpi8+ksQiYRIaENVt
         Y9MI9X9gHXyijdLEn1XB5kRU5/FXivWdE/zwZSs5H4OoshDTKT1xW4zR7RcPWcoY/ocQ
         qR2C1O/K4KKaR8eFXPK9YpM30qzqUIPJDgAb8yvGy9QnQR+8B31fYYsyS5pYY+pIdoMU
         jw9aq31caZQNvIG9USHZGJohlJQC/m2rFE9XMMbb8VC7OWkIxHk9XyM1cwFb+vAF3qHe
         3vcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004929; x=1694609729;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/4hkBYyJ5Fo8pHsHiL3xt5mZBV889/2jclxebFibyE=;
        b=DFpaPomZOARpImC8blqyE8aorxLAe+aaFtWfLSWgOuOFOW1KK6Xep+kEITNIwZqVNs
         vkrLsUiEW3IjdMc8RVKeCSgvMltakdLgNqe8vo54t+qJWuc25KTpcOpjSmqWIZOhJngQ
         8b2lAiG5mf4dnZbhY9eRA5kHqgzc08N2PqyE2fd1w1/J4yDMpCw9xJ3on9F3T8N3/skR
         w4UODrLWgQrvejOU7Tyr6QN6FqLEKBOBjRM2hmJFZHI3C3Axa//MkWTHHOXaWcQ1X9S/
         CjEp5cO0N+1QKyfwxwgbLHlpRZzyDLP/gG8kagkiDseHzMLPsdJKpnwJniTeiAOPS8FF
         Z6KA==
X-Gm-Message-State: AOJu0YzRs9qNaAQ4+qbYMrBO26484R0/VXn17tvJic0ei1FEB1SWyp3g
	snVBmItTi/05LGr80fiMFWA18w==
X-Google-Smtp-Source: AGHT+IG+mnCD12BigIkQxODBvjdLpYOtw/DmfkMXZ1d9K9VGk8GwwdVr5boL4hDXXfVUfXUwfcFmyQ==
X-Received: by 2002:a17:90a:604f:b0:263:4815:cb9a with SMTP id h15-20020a17090a604f00b002634815cb9amr14783724pjm.41.1694004929589;
        Wed, 06 Sep 2023 05:55:29 -0700 (PDT)
Received: from [172.20.5.224] (076-053-041-226.inf.spectrum.com. [76.53.41.226])
        by smtp.googlemail.com with ESMTPSA id fv10-20020a17090b0e8a00b0026f5dd4ba28sm1063434pjb.1.2023.09.06.05.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 05:55:29 -0700 (PDT)
Message-ID: <ec577a00-413d-d07a-015f-f42a41787257@linaro.org>
Date: Wed, 6 Sep 2023 05:55:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [GIT PULL] Add soft link for Audio topology firmware for SC8280XP
 X13s platform
List-Id: <linux-firmware.lore.kernel.org>
To: Johan Hovold <johan@kernel.org>, linux-firmware@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-kernel@vger.kernel.org
References: <cd373622-9c44-4fe4-011a-73e879e8667a@linaro.org>
 <ZPhdT9gr1AUt0Gxq@hovoldconsulting.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ZPhdT9gr1AUt0Gxq@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Johan,


On 06/09/2023 04:06, Johan Hovold wrote:
> Hi Srini (and linux-firmware),
> 
> I was going to send a reminder about this not having been merged yet,
> but it appears you managed to screw up the recipient list somehow so
> that it was never even sent to linux-firmware@kernel.org:
My bad. let me rebase those to latest and send a new PR, including 
correct recipients.

thanks,
srini
> 
> 	https://lore.kernel.org/all/cd373622-9c44-4fe4-011a-73e879e8667a@linaro.org/
> 
> As this is needed for audio on the Lenovo ThinkPad X13s, can we try to
> get this merged as soon as possible, please.
> 
> Not sure if you need to resend the pull request or if the above (and
> below) will suffice.
> 
> On Mon, Jul 24, 2023 at 02:11:16PM +0100, Srinivas Kandagatla wrote:
>> The following changes since commit c7824580d310809b55f95626b4b46954911be820:
>>
>>     Merge branch 'v2.0.21961' of
>> https://github.com/yunfei-mtk/linux_fw_10bit (2023-07-24 08:30:51 -0400)
>>
>> are available in the Git repository at:
>>
>>   
>> https://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git
>> sc8280xp-audio-fw-fixes
>>
>> for you to fetch changes up to a8b2a94c58f5cd9dc93b56dbdce83c867ea1e916:
>>
>>     linux-firmware: add link to sc8280xp audioreach firmware (2023-07-24
>> 14:05:12 +0100)
>>
>> ----------------------------------------------------------------
>> Srinivas Kandagatla (1):
>>         linux-firmware: add link to sc8280xp audioreach firmware
>>
>>    WHENCE | 1 +
>>    1 file changed, 1 insertion(+)
> 
> Johan
