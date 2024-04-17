Return-Path: <SRS0=tm4Z=LW=gmail.com=superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770CBC4345F
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Apr 2024 12:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42B85C2BD10; Wed, 17 Apr 2024 12:31:39 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7454CC072AA
	for <linux-firmware@kernel.org>; Wed, 17 Apr 2024 12:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7454CC072AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-2220a389390so319169fac.0
        for <linux-firmware@kernel.org>; Wed, 17 Apr 2024 05:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713357097; x=1713961897; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6FP/2ClpXaTiUthsKID9Bzx30aESUzU+AMNyJVkfhc=;
        b=DcSU0PdHLx3t55wDv3HQSjGWqYOTUKRGH7k83n5o0e3YCZUDTjpFa+bjTR10hznOLO
         z+pg3pC4aD0RN0sc/ifwIunw07/Q6Fgq8hFN+z0amw5MP8gTWgjYDRCRubnba0OOhsQ4
         QQ4AxKAm2PR7k/qnVSBkbnu0g7wrrn6Nlkp25a3kvoEJ0XNYXxgy2f/MAwgliSwRM9kU
         JiQE/v2Kqv4c40tpJS30UlGXrf+J1bND+OzphvYHr9hwx+h6yH36P9aO9p9mV5voBs11
         guzU5LPTYNW7mE1zUaN8YW1CM7mPYNZYnhXcBRPk8/mPTqzZAsvOMARyDLv0Tkl08fmS
         RLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713357097; x=1713961897;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A6FP/2ClpXaTiUthsKID9Bzx30aESUzU+AMNyJVkfhc=;
        b=F2U0vA9A5D74+9SarbMPwcMVd7iAqZ12EmDUKsZ8WB/jo2EwNSCOqyy2qvvjkcW4j8
         6uIVDgiPlfTldCRqOiUQrgBUDe3aOIkU5jBaEUoNshCUMDJqNnzwOnjBbU2jiv0ibLT3
         um48mooVR+nc76O+kewgah9Zw4Zs7sbTz15MwfYRq2Sa7jRGt1sBodBV8pWqTuMJeMq4
         tb5AO3R2aMuvcKGA5C6bB6RB7AnRj4bZTXgtLTCUdU7/yxEIAOhfRRANRHcAuf8ymRsB
         HhPg+MrcBOUGU+SIzzDHV7iGWTWocjq+ywJpKGpEqpyaeoUHvT0BvG6ZW9IPh61DIDmN
         oCzw==
X-Forwarded-Encrypted: i=1; AJvYcCVsnzC724qJahfVln/oYch4BnzoSd3tlGDRQVsvttSO37Nf8bHVwQNiGYrR4l+FjhnF2WN39OhSdHb9iKsjPIaXMyYji8P79dfp
X-Gm-Message-State: AOJu0YxnJRbViyOlvUj51YNBBiryGIUxhFt2Ml5qKSmXKBTrJyVRlybS
	PH7p3D6v0hRtBqiiJWw0ZHxOn8nTGUmn1iowAOKl4VlzRhXL8wsI
X-Google-Smtp-Source: AGHT+IE3OE+iAfPHAVKKR3nodfINMck5zYvFu2yQRB8auXscURAAFjoOp/bRcuECCxmeCJ+MEJm1kg==
X-Received: by 2002:a05:6870:d10f:b0:222:8961:43fa with SMTP id e15-20020a056870d10f00b00222896143famr1856788oac.15.1713357097285;
        Wed, 17 Apr 2024 05:31:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:70:f702:9c77:c230:a0ba:a1a1? ([2600:1700:70:f702:9c77:c230:a0ba:a1a1])
        by smtp.gmail.com with ESMTPSA id de6-20020a05687075c600b002389f42604asm260223oab.30.2024.04.17.05.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 05:31:36 -0700 (PDT)
Message-ID: <9aa64d50-cb4d-4118-bc27-86c23410ff8b@gmail.com>
Date: Wed, 17 Apr 2024 07:31:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: putting future iwlwifi firmware into intel/ ?
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>, linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, miriam.rachel.korenblit@intel.com
References: <fec30176f437d565d4c1dfc4944373f117d75a64.camel@sipsolutions.net>
From: Mario Limonciello <superm1@gmail.com>
In-Reply-To: <fec30176f437d565d4c1dfc4944373f117d75a64.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/17/24 06:18, Johannes Berg wrote:
> Hi,
> 
> Since I was just looking at some firmware related thing (files for the
> hardware that might be shared between Intel BT and WiFi), I noticed that
> just over 30% of the files/dirs in the top-level firmware tree are
> iwlwifi-* files.
> 
> While we can't move the files that older drivers might consume, we could
> e.g. change the driver to look up future versions/future hardware under
> intel/ instead? Would that be worth doing?
> 
> johannes
> 

How about moving them all now and then creating compat symlinks for 
older kernels at linux-firmware 'make install' time?
