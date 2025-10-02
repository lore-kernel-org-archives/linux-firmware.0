Return-Path: <SRS0=cnmb=4L=linaro.org=bryan.odonoghue@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A0ECAC5B8
	for <linux-firmware@archiver.kernel.org>; Thu,  2 Oct 2025 10:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D7520C4CEF5; Thu,  2 Oct 2025 10:22:08 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C61E7C4CEF4
	for <linux-firmware@kernel.org>; Thu,  2 Oct 2025 10:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C61E7C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb7a16441so152174166b.2
        for <linux-firmware@kernel.org>; Thu, 02 Oct 2025 03:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759400526; x=1760005326; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oeiyxphdp3FpXWm94GNIfpVrA+00q3hmgfltim/4eOU=;
        b=gWk2UP3s6NtfwpQNOhVaEGy3yEKSwA79tVIvimkV085NR9ZmOeerK5xWo52zal7VHi
         7U7AxsyEkoZ/RUSlWW39Zpo+7kgnwM+VmbBaRjcNEvqdzKHEichb2m7MKLqcLnZU4rzP
         0/pakqH1/v9eLhf/f1Omjk97zE6Cs7r8HAgEzbZoynWIoGZ9IZmTTCCOLsugdOaR/Y/5
         6jk1DY0NCTtqOmidDbDlBHHKpSMM8Kh8NkmwjNBc88kIMh0K9BNS8xasPFYZrDAsuTEf
         nxmpFK6CPg7ZBNhup7YOJ4EXkie/cxS3STXe+CszYv93YKQBlxDdJjCWrexSN5+q+0VI
         DNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759400526; x=1760005326;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeiyxphdp3FpXWm94GNIfpVrA+00q3hmgfltim/4eOU=;
        b=VMJ/ZBqDrm47wU1oiozeM/VxeXlvO1V78MWDE387+b+/zjI8MLSJU0my8cULtk6z2d
         q+doAGTAd9d71SMDu0TZxoV7bL8mBZ8BgYAoRLTUPrLN6qkhQcU/ma912CSxioozo++S
         cOothk73BQDPbESv8FceKDoLqsurayS0c4TEhzA06jlQ48/uLsn4W9uRSsdpXyyxqLLm
         8ZHsI87WWWIkrZlkfCq9RmnkvWl6A2iypCyY/NkMbaUlMtxjE3H6//676jQ/6aNqP+2C
         I/x7IzotoFL1Zj8Boi7g2B0hTmAlwW1CD2p1mWKXb8+iNKXb2Z1CQ9guVlt2dOMJJvrO
         grNg==
X-Gm-Message-State: AOJu0YwJIkO6D6nmPkcHhiNLTnZrhLEfttk7WawqgFsRnFmwTL/35ty1
	sPyFTyEeYPStj6BRFtgzViDAbbnHfcAPTTJt68Nu93EssTXSXVcACuvDBGqTv7gUwsE=
X-Gm-Gg: ASbGncsNhZ7FkwOt5ngQSxsHHS+oakGLTM27ir3sicK1AnDhIqrqFlIHOJnek8597xU
	bCUFwSwRyI0k5cq0OSR5lFfzrVUwEBAokVBawEIKgcphNCghcxea0RPKhwcpU4kvP8ZFGtFAhkp
	9WTSPiCWth2d4/7WnHAgm2Yy1ynUS89VCZi8ThIWC2Q7AUKMuqvPKWwck8Y7+N2HFP1AvWijuPN
	BQjtMaOwf0JCfcP98xJNAaiIM9Oa/VeVk/Njd6r7rZ1C6Y2CFk5RgxuKnQG/f5Q18cT/fA+Cavv
	crk6+3kC60ITVVYAr/Ml82M2T7qBlPUlsn4zYdrV7LhjFKUDwLUO7kPZ1NzcXgX3YoSzyuLkjce
	3fucQ7FGcftqQBFAfRuyo4IVxBYdrosd1uOssTJiFIY+DOgko0g2GOl4FoPtjzGHqZ66o/ddy0X
	73wJMa1hg1i1pRhZvmsh9bWEER5S4=
X-Google-Smtp-Source: AGHT+IFlPW8rmREopOYD1ffL5rQR075BadaUVl2h1wYxunv5yBlFe80ZtrFLuMWhLlswGcWI/Kz3KQ==
X-Received: by 2002:a17:907:d14:b0:b10:4355:2e63 with SMTP id a640c23a62f3a-b46e516b397mr787392666b.46.1759400526066;
        Thu, 02 Oct 2025 03:22:06 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e7e8b7sm172388266b.40.2025.10.02.03.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 03:22:05 -0700 (PDT)
Message-ID: <25e6e163-f91f-4fe5-9454-641914d2eb43@linaro.org>
Date: Thu, 2 Oct 2025 11:22:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
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
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
Content-Language: en-US
In-Reply-To: <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/09/2025 13:55, Bryan O'Donoghue wrote:
> On 24/09/2025 11:43, Dikshita Agarwal wrote:
>>>> I understand your concern. To clarify, we are not removing support 
>>>> for the
>>>> existing Gen1 firmware, so backward compatibility remains intact.
>>>>
>>>> We are simply adding support for Gen2 firmware for this 
>>>> architecture. As a
>>>> result, QCM6490 will support both Gen1 firmware (with the Venus 
>>>> driver) and
>>>> Gen2 firmware (via Qualcomm's video driver [1]).
> 
> I agree with Dmitry here.
> 
> Its not possible to disjunct upstream HFI6xx @ the firmware level 
> between Venus and Iris because the DTS would have to point to a 
> particular firmware depending on which driver you wanted to run, which 
> would make the DT dependent on the driver, which is not allowed.
> 
>>>> Additionally, as part of our plan to transition all Venus-supported 
>>>> targets
>>>> to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1 
>>>> firmware
>>>> to maintain backward compatibility.
>>> Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
>>> interchangeable for the hardware they both support, until the venus
>>> driver drops support for V6 hardware. At that point it's expected that
>>> there will be no V6 support in Venus driver.
>>>
>>> You can not simply upgrade to Gen2 firmware as if nothing happened.
>>> Consider a device node on SC7280 / QCS6490 with the firmware-name
>>> pointing to OEM-signed firmware. Both Venus and Iris drivers would
>>> happily consume the device node and try to work with it. One will work,
>>> another one will fail. This is definitely not what we have agreed upon,
>>> when you started adding Iris driver.
>> @Vikash, could you please chime in?
> 
> It would OTOH be possible _only_ release a HFI6xx Gen2 firmware for a 
> new SoC that doesn't appear upstream yet but, that's not the case with 
> 7280/6490.
> 
> ---
> bod

So discussing this with Vikash and some other qcom folks, I realised the 
DT binding at the moment doesn't depend on the firmware name, so my 
concern making the DT depend on the driver is not a real problem.

I think in fact it should be possible to point venus @ the gen1 firmware 
file while pointing iris @ the gen2 file.

Unless there's something here I'm missing, that should work for the 
update and the agreement.

Dmitry ?

---
bod
