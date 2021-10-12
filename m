Return-Path: <SRS0=Mxir=PA=gmail.com=vicamo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24DFC433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 12 Oct 2021 17:09:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8A9E761076; Tue, 12 Oct 2021 17:09:14 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 456A460F38;
	Tue, 12 Oct 2021 17:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 456A460F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id m14so100922pfc.9;
        Tue, 12 Oct 2021 10:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=91nycAB/daKJpetGgoEdS89QH9eAYjPCQksJukAVryI=;
        b=x27lMwo/rsd2Q1w4luCze8waEV4/PGaSfGU6VtgSJn8YbnVmCnIEQh7iV6rA+cC8gU
         FrVmIVct5Exn5PShQ1EoSTGVmrQP5LzEzxoWdKtFpOqdvt1y2Pcfb4YWGMmhbURvy4Q+
         LHqpoBl6fUNTB4CPdmxctXxK4GXcv+gJ6858psy5n8FEVHwZefcXjHF5vA3w/NfUamv9
         alLg17nYkK6XPUeO2xB3Qs5q06Ne7ISVIopx0qTgQ+wZbMi2HYi7O1jDw3RjeskzR4rH
         CO1xDr+E1abZK88G7et4NTZCB2Tie35GRDGSr3RL4rXjCBMmXCwGFU7ibXNh2i8pecjH
         Hbcw==
X-Gm-Message-State: AOAM531dcrg1I2v/RETc4Bud+TcGKi4RDvvVDerbEM2gMlOrfljH7JLy
	HPuExDpSoLZb4kGK5hRPACb/Iz3yDms=
X-Google-Smtp-Source: ABdhPJxOyRigB3w0hNOvt+iqx7y9/NSms/Sff46PvGaCtZ+byob8AvlFsX8onJQGkJLb1nlxEY+0sA==
X-Received: by 2002:a62:641:0:b0:44b:74bb:294c with SMTP id 62-20020a620641000000b0044b74bb294cmr33771925pfg.12.1634058553533;
        Tue, 12 Oct 2021 10:09:13 -0700 (PDT)
Received: from [192.168.0.242] (218-173-165-98.dynamic-ip.hinet.net. [218.173.165.98])
        by smtp.gmail.com with ESMTPSA id k22sm3766541pji.2.2021.10.12.10.09.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 10:09:13 -0700 (PDT)
Message-ID: <ab40cd13-63ab-0247-13f2-e349d88c243d@canonical.com>
Date: Wed, 13 Oct 2021 01:09:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: amdgpu firmware
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>, Josh Boyer <jwboyer@kernel.org>,
 Linux Firmware <linux-firmware@kernel.org>
References: <CADnq5_NNuBcZWd66TcuTevyajrw5X2q2+KURtQwS4AhZoPwmZw@mail.gmail.com>
From: You-Sheng Yang <vicamo.yang@canonical.com>
In-Reply-To: <CADnq5_NNuBcZWd66TcuTevyajrw5X2q2+KURtQwS4AhZoPwmZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/21 03:55, Alex Deucher wrote:
> Hi,
> 
> The attached patch adds initial support for beige goby, a GPU from
> AMD.  Please apply.
> 
> Thanks,
> 
> Alex
> 

I've tested this against an AMD Beige Goby [1002:743f]. Works for me.

Thanks,
You-Sheng Yang
