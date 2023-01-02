Return-Path: <SRS0=wgDl=47=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F48AC4708D
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Jan 2023 16:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E151C433F0; Mon,  2 Jan 2023 16:11:28 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4046DC433EF
	for <linux-firmware@kernel.org>; Mon,  2 Jan 2023 16:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4046DC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id x37so22495964ljq.1
        for <linux-firmware@kernel.org>; Mon, 02 Jan 2023 08:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Is7YSRFexbFPkS6SNxPx9tYpyFE0kbk8P6zJ6mHk+LE=;
        b=j7ll+UoP3/2eQTn5GOH8kQTTyvbacR7DzYyTvA/1kF/pTfzTpoY4B/WD5XKvlniJjd
         avsqFNeZzQaH9w4f4OusbCgk1ThsYX0gOb84pz7rB7X62RHbdRcsz26qcNbDmso4Nn7a
         UKZWFiN4DWpV7ZnU8FF/dd/QB3ChHL+iaA+Hc9e2ul3cXDxgp/I/TZQEHCpZunheUKRa
         AiCED8dNYPFgVDbkbOfUCR9UKDuDkE6FTtDWbORunWYvOj0FPIj8aHSxu30AIbG8err9
         OJmm0iQ+2FVGe/28aF9lcx8OA3zojXaYUJ43MRe89S0wrPp8Lt1vZGkl0uI2ehuaI+og
         ZMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Is7YSRFexbFPkS6SNxPx9tYpyFE0kbk8P6zJ6mHk+LE=;
        b=sQr+ABlCj+ZBlI6ns2dQ8w/MGokOu85VBXcGIC4RXQGhnv5qmbk/7LKoRpcStCnL/s
         3Pwa4bF1M0gDzKWCq07WX9NGCTSBme6cJuddN99UGPmFHA7iULKV5cp0o7p0bdj+gfQU
         oOBhnfbpPsJ3111pTdpTYP08muO0RJbZFXPJ7f2UWl70yJY10I4KWrY/EDnsRQ/UMgpw
         rQeb8oD6BROaUOitD6VkAL1YV5F10DjKDRmnF3N+c4R6QfUwYDyoPr7FYpmai/cw4Svl
         KB/V09D26cRQtBO8A+J2XrFZzqkqABQ23NkpXLIucF9bHYpaNhCfANZn+2mhaQSSBTDh
         OF8A==
X-Gm-Message-State: AFqh2ko1BPDEfWJGj4O+4pTSJLsym9fp2taK19a9JKhf/4fMfthJ0+Ae
	rX/yGE+tiLsTSDYEua33W64vbxYQsdfNrImd
X-Google-Smtp-Source: AMrXdXsyMx543C+5Lfg6vWfKeygYpjRvKT2OsfOKWCGzx4jDP7oNPBa44iq8QVq2Ou8fB/6G5FofCw==
X-Received: by 2002:a2e:bf01:0:b0:27f:c02b:a04b with SMTP id c1-20020a2ebf01000000b0027fc02ba04bmr8245906ljr.42.1672675885210;
        Mon, 02 Jan 2023 08:11:25 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bf25-20020a2eaa19000000b0027fd93e9043sm1179514ljb.113.2023.01.02.08.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 08:11:24 -0800 (PST)
Message-ID: <54fb0621-1eb7-f7f3-08f2-1b1cf5ccdec2@linaro.org>
Date: Mon, 2 Jan 2023 18:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] qcom: add firmware files for Adreno A200
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Fabio Estevam <festevam@gmail.com>
References: <20230102131443.905304-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230102131443.905304-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/01/2023 15:14, Dmitry Baryshkov wrote:
> Add firmware files for Adreno A20x (codenamed yamato), found in
> Freescale i.MX51/i.MX53 and in some prehistoric Qualcomm Snapdragon
> SoCs.
> 
> The firmware were generated from the header files from EfikaMX kernel
> sources ([1]), which bear copyright by QUALCOMM Incorporated and have
> BSD-3-Clause licence.
> 
> [1] https://github.com/genesi/linux-legacy/tree/master/drivers/mxc/amd-gpu

For the reference, the same original files are available from CAF:

https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/mxc/amd-gpu/common?h=imx_2.6.35_maintain_caf

-- 
With best wishes
Dmitry

