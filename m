Return-Path: <SRS0=cnmb=4L=linaro.org=bryan.odonoghue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A192ECAC5B0
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Oct 2025 14:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 702C9C4CEF9; Thu,  2 Oct 2025 14:29:08 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6ED6BC4CEF4
	for <linux-firmware@kernel.org>; Thu,  2 Oct 2025 14:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6ED6BC4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3e9d633b78so240131166b.1
        for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759415346; x=1760020146; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQfCWHeADRMRctoSeDLhAiNPu6h3f7C5McM5+dE+g+A=;
        b=ssI0aDTucNNpVMUy9LkbpMbAjqmUE4Ycm3SbpBA4BkFGIrSmoiUUa+9IqobC2GxNc9
         yLrY4r5qmtoHWWJiYTkxIddrrVLYYr6qu1XzLPq0EqlbM55DnI1kZdkij18BB7PpuFGY
         SiSy4RF1RjSOBj9UIxtMmRMOpuUJL7oVX8bYrG1GCcmkqilqpvzRCa5UqSSEcFHip+hM
         nL9a3/OfouexeXAqU3Kz//racNS1sjk0gVQmBPUxfg6us0VG9POpejyxgB1Zc1g9FGE8
         EyLERON1HSydDGMrCHGXmlfCcN9jBodATE+ewIvC/EfJSUbrWaYItnGiWQCBT4yO4kK6
         +NMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759415346; x=1760020146;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQfCWHeADRMRctoSeDLhAiNPu6h3f7C5McM5+dE+g+A=;
        b=JpEF5Zr2kovz2ucIHVBeVEFC+GO2o9he8Eg3UX46c2AO3GQ6deXAOEhIuWsBhqqG69
         Bg2iefnx/iwBAOtJPOqbft+k9cMu3E+nJaj1LLhXwdCGsYJm/MRTQRd2QyqnI0Ha+FnG
         qaRIH8QKhqVDQJKMyDUpCYUjsm3NwlC6weGUe0rZE7dj3IJjCZlg+DuX5kIdj/m/PDBn
         QcAyNCIhxksOEbGE/arIgiPoKkMfZmIaYQ2hMp8jZl9DkpUtMzO0O5sHkBOW5+O6cowm
         8cyVtM+lTIzaTIeXVmLDHefWR6Eupiej24jtPv7VwZfQZiG+O9hiQ5pLjogymDd+3AFQ
         Bu+A==
X-Forwarded-Encrypted: i=1; AJvYcCXb06SGCMkZDKJ5AADC72wNwZv+/VUv97M6C3xt9w/gq4d2BhkYgWBGMYj4hp8OC6QuWA3nWflpFerHyxbNUQ==@kernel.org
X-Gm-Message-State: AOJu0YyOSP3GptMcG8vZ5327vMyLv/mIwuRt31RbyNRBuuqWq9tnMWyv
	DOUMPifdimb0Y8mWFwHyQ2nm9OwUIPzdpolEqkGsbrg+KZX1uZ8O16rgUCXMmH4RLZs=
X-Gm-Gg: ASbGncvodNCo4p9Y9c+nLkf12vfMrPI1Z8NU6u0TT4Kq2e0MuyAlSOahQ32HYHaZSmB
	YmGSIzgq0eycGi0hdGSXFhtIW8fnvwnyUmH2Zy78YJwj2urllvuo9BV3AgXH4dYYV76iwlFQI/B
	dr/vHrXFzuK9L2sdVaoecWOEkRdDMoQ/Au59NNmTYO2Hxu5Mzb3K0wZolve2o3ED/9jvJAzqqqe
	V8rAnezYm9UWCwy6j1FGi9MO9wFjaItPrlJCrQNoJEbP5ioYT3VZCqsrpMHBaqP4j3MLorw65L8
	wwPUTu5qTB2EVhdBTnlHz8P84m4ibzcraaomriVkJ6JHDXIFWlolmGvMkTJtrHTwdNMgZ5CCf0l
	ZC/evITFrWkeCuYRa5aCzUpKklF/c7TmQOiUROhOnWjwXrFs0vfku7oxKS1qVWZ0lk7L5XsfaP/
	Fev0Nti23AEIyLKypsxHnZb6xNsC8=
X-Google-Smtp-Source: AGHT+IGnulA+Q5h9/q8aA5Ppg3Byl6uFpjHjx1bhWf6x3fEjpyWL4Kz+sYqViTJlhMs3unwt4RSJ4g==
X-Received: by 2002:a17:906:c10a:b0:afe:159:14b1 with SMTP id a640c23a62f3a-b4859e7d413mr481034266b.9.1759415345681;
        Thu, 02 Oct 2025 07:29:05 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a26e639sm226244166b.98.2025.10.02.07.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 07:29:05 -0700 (PDT)
Message-ID: <7fca9e71-b9d4-427e-be66-56f813096cd0@linaro.org>
Date: Thu, 2 Oct 2025 15:29:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, linux-firmware@kernel.org,
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
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
 <25e6e163-f91f-4fe5-9454-641914d2eb43@linaro.org>
 <CAO9ioeUa2Ea7CNsXpUANyKiqfjzW0uQU_ZxgEw==uMA42eF1NQ@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAO9ioeUa2Ea7CNsXpUANyKiqfjzW0uQU_ZxgEw==uMA42eF1NQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2025 15:24, Dmitry Baryshkov wrote:
>> I think in fact it should be possible to point venus @ the gen1 firmware
>> file while pointing iris @ the gen2 file.
>>
>> Unless there's something here I'm missing, that should work for the
>> update and the agreement.
> Both drivers are supposed to work with the same DT entry (that was the
> agreement, they should be interchangeable for the migration time).
> Consider having a device fused to require vendor key and a venus node
> with the firmware-name pointing to the vendor-signed firmware. One of
> the drivers will fail to work in such a case.

Does it ?

Your firmware over-ride is in the DT - which is a downstream thing right 
now for sc7280, in which case you're required to manage your out-of-tree 
stuff yourself.

Else you operate from platfrom data buried in the driver which we 
control in upstream.

And my own thinking, I've been semi-convinced anyway, is that in reality 
the gen2 firmware is the only one that is going to "get any love" i.e. 
we are probably _only_ going to see time/money invested in that interface.

Hence its in the interests of 7280/6490 users to get onto gen2 firmware.

---
bod

