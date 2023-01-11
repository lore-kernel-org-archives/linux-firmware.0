Return-Path: <SRS0=XpGd=5I=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EF3C5479D
	for <linux-firmware@archiver.kernel.org>; Wed, 11 Jan 2023 15:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2D32C433F0; Wed, 11 Jan 2023 15:17:28 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56062C433D2
	for <linux-firmware@kernel.org>; Wed, 11 Jan 2023 15:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 56062C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id y25so24010409lfa.9
        for <linux-firmware@kernel.org>; Wed, 11 Jan 2023 07:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlgknWCIjS2RR5Tk0iFRYYkOPXhOBgXLv/7zm5r7H2U=;
        b=he0qnGXX/gKyYnMgoZJzJmy66F5WVTbq3SQ9oR4dw5KsvUdQoFuPKXrJ7rwqZmzyOU
         jv+krUdI0VmZbDJ6lvrfn+GEfMPJcEKCpf9eqnNubDjWbhNvY1ijXPIOnRQgd4VAJobt
         /0/quEPnCPiWbkVD6iXz9JAGwYUTsH4Ub61KDY7zYA+9K6+jfkxtc1REfMCLAHpgoAvu
         Xda4Ewt05iyFVvPe8mFZXHPQxh6FGGL/Gf5At9yWelrs0xF9Ij3UK0+y3L6vORRjHpkN
         huYivfvEnCXoF/agz+T4S8BsQDz1/lN0nXJONbejoJsFfVghWZ2yXQKgxgtnbmMFz/Q8
         wWSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlgknWCIjS2RR5Tk0iFRYYkOPXhOBgXLv/7zm5r7H2U=;
        b=NcZ3G3MiCZLoguZRWQXpQ+vGexeFF0FlDRKcR79MB6rdeG9uCtgJempeOqNjsxi0Y+
         TpE48sslAg5em8K8GtWUN/A+SH54EYsWRoY7s8sonaSKll3D6wjuJOzz9tFecaAnh4cP
         daeq9xZ/rko14BAXRawvuzgYt0jl+lF3c7vK1BZfH0jqteBJE+lP4JbTRthAwuX2wHwi
         mI2o2rkroZ7mkfLMFGkz3OG8uQZHrOmGYdJNMwwSiQmdmQ2LRkYEtox5UWiJBrvpvLDU
         kQUUUtcU/+GHpF7hwJA5U0C2HSOfWnbJ3wcznE5aXXdK5+MW4nogAtVjtl9ljAfqQF5r
         MSjQ==
X-Gm-Message-State: AFqh2krc+rSGeOF68Jmbl2QjqxKpid+O94h0pkmSfYPbgks/Q2L9Di6N
	oC6gfP5zW4JjM7AHNDd1C2mD8Q==
X-Google-Smtp-Source: AMrXdXutD2xSrylsaUlXCvvwGEgt4CuoSkD+OPBYrqJw+ac7wkB7w1VQ9LWFLSOloVxJAXdPv5yLtw==
X-Received: by 2002:ac2:4f0c:0:b0:4cb:43ea:bd9 with SMTP id k12-20020ac24f0c000000b004cb43ea0bd9mr8119305lfr.18.1673450245412;
        Wed, 11 Jan 2023 07:17:25 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m15-20020a056512358f00b004cb39d89f40sm2770954lfr.248.2023.01.11.07.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 07:17:25 -0800 (PST)
Message-ID: <d6aa1de2-55c5-c9cd-76f6-d94e91ca4e84@linaro.org>
Date: Wed, 11 Jan 2023 17:17:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] qcom: add firmware files for Adreno A200
Content-Language: en-GB
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Rob Clark <robdclark@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, Fabio Estevam <festevam@gmail.com>
References: <20230102131443.905304-1-dmitry.baryshkov@linaro.org>
 <CA+5PVA5ZXLZM=iVvr9tMSGeRbRLgzuODt4bkt+ZvMnzF50MU3w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CA+5PVA5ZXLZM=iVvr9tMSGeRbRLgzuODt4bkt+ZvMnzF50MU3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2023 14:51, Josh Boyer wrote:
> On Mon, Jan 2, 2023 at 8:14 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> Add firmware files for Adreno A20x (codenamed yamato), found in
>> Freescale i.MX51/i.MX53 and in some prehistoric Qualcomm Snapdragon
>> SoCs.
>>
>> The firmware were generated from the header files from EfikaMX kernel
>> sources ([1]), which bear copyright by QUALCOMM Incorporated and have
>> BSD-3-Clause licence.
> 
> How did you generate it?

I hope you don't mind putting the program here.

// SPDX-License-Identifier: BSD-3-Clause
/*
  * Copyright (C) 2022 Linaro Ltd.
  * Author: Dmitry Baryshkov
  */

#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <errno.h>
#include <unistd.h>

typedef uint32_t uint32;

#include "pm4_microcode.inl"
#include "pfp_microcode_nrt.inl"

int dump(const char *name, uint32_t *data, size_t n)
{
	FILE *f;
	int ret;
	uint32_t zero = 0;

	f = fopen(name, "w");
	if (!f) {
		fprintf(stderr, "fopen: %s: %s\n", name, strerror(errno));
		return 1;
	}

	if (fwrite(&zero, 4, 1, f) != 1) {
		fprintf(stderr, "error writing data\n");
		fclose(f);
		unlink(name);
		return 1;
	}

	ret = fwrite(data, 4, n, f);
	if (ret != n) {
		fprintf(stderr, "error writing data\n");
		fclose(f);
		unlink(name);
		return 1;
	}

	fclose(f);

	return 0;
}

int main(int argc, char **argv)
{

	if (argc != 3) {
		fprintf(stderr, "Usage: %s <pfp> <pm4>\n", argv[0]);
		return 1;
	}

	if (dump(argv[1], aPFP_Microcode_nrt, PFP_MICROCODE_SIZE_NRT))
		return 1;

	if (dump(argv[2], &aPM4_Microcode[0][0], PM4_MICROCODE_SIZE * 3))
		return 1;

	return 0;
}


> 
> josh
> 
>> [1] https://github.com/genesi/linux-legacy/tree/master/drivers/mxc/amd-gpu
>>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Jonathan Marek <jonathan@marek.ca>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>
>> Note: the following patch needs to be applied to get this firmware to
>> work. It is most likely to find its way into the 6.3 kernel.
>>
>> https://lore.kernel.org/dri-devel/20230101155753.779176-1-dmitry.baryshkov@linaro.org/
>>
>> ---
>>   LICENSE.qcom_yamato |  25 +++++++++++++++++++++++++
>>   WHENCE              |  13 +++++++++++++
>>   qcom/yamato_pfp.fw  | Bin 0 -> 1156 bytes
>>   qcom/yamato_pm4.fw  | Bin 0 -> 9220 bytes
>>   4 files changed, 38 insertions(+)
>>   create mode 100644 LICENSE.qcom_yamato
>>   create mode 100644 qcom/yamato_pfp.fw
>>   create mode 100644 qcom/yamato_pm4.fw
>>
>> diff --git a/LICENSE.qcom_yamato b/LICENSE.qcom_yamato
>> new file mode 100644
>> index 000000000000..1fd702bb9264
>> --- /dev/null
>> +++ b/LICENSE.qcom_yamato
>> @@ -0,0 +1,25 @@
>> +Copyright (c) 2008-2011, QUALCOMM Incorporated. All rights reserved.
>> +
>> +Redistribution and use in source and binary forms, with or without
>> +modification, are permitted provided that the following conditions are met:
>> +    * Redistributions of source code must retain the above copyright
>> +      notice, this list of conditions and the following disclaimer.
>> +    * Redistributions in binary form must reproduce the above copyright
>> +      notice, this list of conditions and the following disclaimer in the
>> +      documentation and/or other materials provided with the distribution.
>> +    * Neither the name of QUALCOMM Incorporated nor
>> +      the names of its contributors may be used to endorse or promote
>> +      products derived from this software without specific prior written
>> +      permission.
>> +
>> +THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
>> +AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
>> +IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
>> +ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
>> +LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
>> +CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
>> +SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
>> +INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
>> +CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
>> +ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
>> +POSSIBILITY OF SUCH DAMAGE.
>> diff --git a/WHENCE b/WHENCE
>> index f31fa308cc89..f14730a31368 100644
>> --- a/WHENCE
>> +++ b/WHENCE
>> @@ -5742,6 +5742,19 @@ https://developer.qualcomm.com/hardware/dragonboard-410c/tools
>>
>>   --------------------------------------------------------------------------
>>
>> +Driver: adreno - Qualcomm Adreno GPU firmware
>> +
>> +File: qcom/yamato_pfp.fw
>> +File: qcom/yamato_pm4.fw
>> +
>> +Licence: Redistributable, BSD-3-Clause licence, See LICENSE.qcom_yamato
>> +
>> +Binary files generated from header files in EfikaMX kernel sources. A prefix of
>> +four zero bytes was prepended to make them work with the DRM MSM driver. See
>> +https://github.com/genesi/linux-legacy/tree/master/drivers/mxc/amd-gpu
>> +

-- 
With best wishes
Dmitry

