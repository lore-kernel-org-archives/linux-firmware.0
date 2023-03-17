Return-Path: <SRS0=v5am=7J=gmail.com=chunkeey@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB905C6FD1D
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Mar 2023 22:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D7B7C433EF; Fri, 17 Mar 2023 22:26:03 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 88DADC433D2;
	Fri, 17 Mar 2023 22:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 88DADC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id w9so25885315edc.3;
        Fri, 17 Mar 2023 15:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679091960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0s6t+9RjEdrsp5YQYHkmbrJDFcm9COEbv7mGZ9wgzsU=;
        b=QUqnle+0EmUmhlKvgw/I8Bq1J1xWzYWEmh6yO2NeT7xRGGKs8I8iutPRm2UtOVvhzt
         uXbzA2k4fLC3/5TWUw/e0L6FilIeQ5L92QfwUQMaGcrOql3h/KHXqeqt93F6uVVs3IrY
         jUOikKxfgraE+Cupb8mT4+kJTYThLwqXE8F9PHTRSK6POsiULCIMjTPz/7FUFAN+/aMs
         m7dJlWpJ3KFQV/CsA6l9VEe9NsB0evvX2TTroX0BLK0n0/bygTdsMWA450M2jh27WErU
         87ZYIeveExa3z+UXGQXQ5o57zfMZkIqPQ3+c6OMA6U9WvVJlP+SU1XS2d0Fn55xI5tzV
         MjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679091960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0s6t+9RjEdrsp5YQYHkmbrJDFcm9COEbv7mGZ9wgzsU=;
        b=51Qlre5rFKJgE9xKQvozWd7spMQCIor3onr2uR/070h6RhElE+ejytY+KYgb7884Es
         3EnmP1NYzoJqRS69lw2aFy1rL6lfwWM5BqLUheRrgo+bSgqcW5TH/ilcsUqwzuPVPbx1
         8RpL1glCqNmH+H+KEfbEM2Vodc89akIoZwehKHb8tPoHc0/NuiYYKLUX8RK5uqCaD+rT
         GMIU8rauGorG/HUBuhvPjC2PmHBaxRVpIDPRLFM9UsnHepBirnTiynfT8uUh8PskRt3Q
         SMycSQB4mNBsIWq+t1l2OHu86kL38c+Nnp1dUAJP/J7omCapgn8txe7gDYrmY41tlhIQ
         yYwg==
X-Gm-Message-State: AO0yUKUUPyt2MlC2mMnqnZIGeD1Z9dh8/ecOCkMLRpEVnIeshbq9h5N2
	md4vlf1UMDD4ktdIiQfQh4m7hTN6+aY=
X-Google-Smtp-Source: AK7set8SBVoNHV487uq5QN66184kD3eVgF4IfriJeM3zmo0G474Q9znhoup7+dw5vZUKchWSIRuW/A==
X-Received: by 2002:a17:907:77d4:b0:930:45ea:4a28 with SMTP id kz20-20020a17090777d400b0093045ea4a28mr1157114ejc.35.1679091960534;
        Fri, 17 Mar 2023 15:26:00 -0700 (PDT)
Received: from shift (p5b0d7c06.dip0.t-ipconnect.de. [91.13.124.6])
        by smtp.gmail.com with ESMTPSA id sd13-20020a170906ce2d00b008e09deb6610sm1408963ejb.200.2023.03.17.15.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:25:59 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift with esmtp (Exim 4.96)
	(envelope-from <chunkeey@gmail.com>)
	id 1pdIVX-0009i4-1k;
	Fri, 17 Mar 2023 23:25:59 +0100
Message-ID: <1b3779a1-7a08-fd26-5fde-c71b648aaa57@gmail.com>
Date: Fri, 17 Mar 2023 23:25:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
To: Kalle Valo <kvalo@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
References: <878rgzuw37.fsf@kernel.org>
 <c9ccbfe1-9535-f46c-756e-4eb19c1afbff@gmail.com> <87a618517g.fsf@kernel.org>
 <97b7f35c-f7c9-1257-ff67-e5b61efe0ce0@gmail.com> <874jqmo7em.fsf@kernel.org>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <874jqmo7em.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/15/23 07:28, Kalle Valo wrote:
> Christian Lamparter <chunkeey@gmail.com> writes:
>> On 2/20/23 06:56, Kalle Valo wrote:
>>> Christian Lamparter <chunkeey@gmail.com> writes:
>>>
>>>> On 2/15/23 10:17, Kalle Valo wrote:
>>>>> Here's a new pull request for ath10k and ath11k. We have new hardware
>>>>> IPQ5018 and various updates for existing hardware. Especially many have
>>>>> requested the firmware update for WCN6855 which seems to fix an
>>>>> important suspend problem.
>>>>>
>>>>> Please let me know if there are any problems.
>>>>
>>>> Could you also please include all the QCA9888+IPQ4019 boardfiles updates
>>>> from last year too?
>>>
>>> I will try to go through them later. The problem here is that I don't
>>> have much time for ath10k nowadays.
>>
>> Ok, should I just post the board-2.bin updates to linux-firmware?
>> I have them ready to go for IPQ4019, QCA9888 and QCA9984.
> 
> But is the problem that then I don't know which one you picked up and
> which one you skipped? Thanks for the offer but I think it's simpler
> that I'll pick the board files instead like before. I put this now to
> top of my todo list so shouldn't take long.
>

Thank you :-) !

Cheers,
Christian

