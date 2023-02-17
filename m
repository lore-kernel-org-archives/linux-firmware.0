Return-Path: <SRS0=xePa=6N=gmail.com=chunkeey@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24BAC636D6
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Feb 2023 18:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 482EDC433EF; Fri, 17 Feb 2023 18:57:07 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5C9E0C433D2;
	Fri, 17 Feb 2023 18:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5C9E0C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id m17so8366104edc.9;
        Fri, 17 Feb 2023 10:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cZK4iMZWPcfp2djDH5P0nJB7FnClrPgur4nJbLfogCk=;
        b=bZkI+ZDXWkrlkum6pG5qrsYh7zAUJjViKF2N+coifZDNAFQzSmAVvKwhtyyithADh/
         gSFcZmiDFt+BdovUlm1Y8dEFajX597ZLDRdjmAvuKM0VL/B7wpuZJlzYI9Ev3P4sXXEw
         UGqFjvhk9PZBgTa3sxKf7qR++cefhVBacAGf1APiD4/fAKXnlnVdyjRMh6IqPkNS2DQm
         ANSF8l79YXWYKzq0kvW60KEVoRRbOjNHNYEPka3FWGaThfWqCPU2/rr1R3vmrvGqfDHH
         VnoaZqCNB1Wg/bL+bfOw2N1KlxA1DasnWSFx17kcjWKlf3OqaGWGS++BU/QxDULbV4Q1
         psbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cZK4iMZWPcfp2djDH5P0nJB7FnClrPgur4nJbLfogCk=;
        b=vcU8cGuO2vg0Z7GSZnl9rT36cixbi3/JwhPgXdurWh75D1y4d93uoI7yVzQG1g8dgk
         tua8M39jI4vCIy/6tTkrrgIsngSIKJDxbIDN+GIEUtSpFoKvJ1i9jdUwi6t98/IyIox1
         aj8i2XfKZUt8OJAfIR3N2/77NAdCZlzrYCe7o+2aO9oI6gx3SoKcKBPWU8n1izxSK9fP
         gorBOhgIpz3GQ/h9LhFSl5h8o+gtsuGpx7+VI78lJeRW4FZEvRNn8OI6T3vHYHAszDXN
         a0bhKB5M9G+hjW5+nIlBwY1O00STa8rhMsE/kSH/aX03rgRP2l/pbZRNTIvf36qyxFW7
         VEFg==
X-Gm-Message-State: AO0yUKVbd96hRaLoTRHavSNY6F1jNGzjFH1jO+80WyoZcHexTLWYGDNW
	PZACScFbo2qb782FbB8Tka2K7B1Jmug=
X-Google-Smtp-Source: AK7set+b4J0inl8B8lYw3XAZ1JbIGLoKK4Xzv7T394iQRyeJB1n7MeyI1/ZTlH5SwHtulf0MrhSxEA==
X-Received: by 2002:aa7:da8c:0:b0:4a2:6573:5c35 with SMTP id q12-20020aa7da8c000000b004a265735c35mr2463967eds.21.1676660224484;
        Fri, 17 Feb 2023 10:57:04 -0800 (PST)
Received: from shift (pd9e2966a.dip0.t-ipconnect.de. [217.226.150.106])
        by smtp.gmail.com with ESMTPSA id j17-20020a508a91000000b004a21c9facd5sm2659347edj.67.2023.02.17.10.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 10:57:04 -0800 (PST)
Received: from localhost ([127.0.0.1])
	by shift with esmtp (Exim 4.96)
	(envelope-from <chunkeey@gmail.com>)
	id 1pT5s1-000HLD-2b;
	Fri, 17 Feb 2023 19:57:03 +0100
Message-ID: <c9ccbfe1-9535-f46c-756e-4eb19c1afbff@gmail.com>
Date: Fri, 17 Feb 2023 19:57:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
Content-Language: de-DE
List-Id: <linux-firmware.lore.kernel.org>
To: Kalle Valo <kvalo@kernel.org>, linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org
References: <878rgzuw37.fsf@kernel.org>
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <878rgzuw37.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kalle,

On 2/15/23 10:17, Kalle Valo wrote:
> Here's a new pull request for ath10k and ath11k. We have new hardware
> IPQ5018 and various updates for existing hardware. Especially many have
> requested the firmware update for WCN6855 which seems to fix an
> important suspend problem.
> 
> Please let me know if there are any problems.

Could you also please include all the QCA9888+IPQ4019 boardfiles updates
from last year too?

Cheers,
Christian
