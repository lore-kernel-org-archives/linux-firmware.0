Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46959606A326
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Nov 2026 20:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=HMUNNLMW
Received: by smtp.kernel.org (Postfix)
	id 38C3D1F008A1; Fri,  6 Nov 2026 20:47:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.166
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1793998068;
	b=b0vcnwSVE6WQnmv95kYB2KWMOecXCSnPFObTzyOLiQ/YtuhQTsKJqi+GCdYppFqhjm7Z
	 tSbodVlybIN8J8BN0vvo1JzCukBteugzzaVz6x9jvZc9vr1HeJhFRA/FMyuFoB5viJrqM
	 45OUlMafyRcQdoqslJa3LF4ybizZZMQ/jApn3dkOl9gB8X098Q5xIwzQ2rDX6pUh0H72i
	 +/hVBfrlNu1beUtKTifMaofi1t6yvEVuME1d/P4PlLAJ0n+UfGiHy9anVfJpIH0QXF2cy
	 zAv9gP+0TKny+YgMlwL0IVEAb/EorTwgPgIwE5KaMbg+snVME2CYGnV/xJvwjDQk2qw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793998068;
	h=DMARC-Filter:DKIM-Signature:Date:In-Reply-To:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:From:To:List-Id:Cc:Message-ID:
	 References:X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing;
	bh=nmJVTWntV63RZ2uvqGPxtFoOxC4SVuuxuL+a6hSbhNM=;
	b=oxxwPCsFkTmRc+RjOd4nfKcaNiH2YGE01LJL/tR46+kCbWqb2UE1XdUAxQ9pxbH9H0+t
	 3ImYEm+TQqi8bf6CCNLwCWr8RJ+NhFLtC3F2r/EvAYhfBCyB1xGLSv9bjZYI8qUq4QH14
	 LUGSF4FtdZLWbzU688CqJWYmYJls/axG56ZsExJllSQniCb1yloufNZAgeJDq8iEgWBPH
	 T5y5plAnbjH+pgikov0bkHkVKsQ9TsRaPcJN0OcAlx5H4nqz+CMYMXk1uJ/rL72N2tKf0
	 aQWreuBimSKflJgH1aYMhPa3x/RidcNskPGlEap8Lh4FuTspoi10yWYvbCE7bmdZk2w==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=HMUNNLMW;
	dmarc=pass header.from=8alias.com;
	spf=pass smtp.mailfrom=8alias.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.166
Received: from mail-200166.simplelogin.co (mail-200166.simplelogin.co [176.119.200.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7E4131F0089F
	for <linux-firmware@kernel.org>; Fri,  6 Nov 2026 20:47:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=HMUNNLMW
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7E4131F0089F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8alias.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=8alias.com
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1793998059;
	cv=none; b=FRjekT5hH+ZTmppdc8x3uBqQvjyjcWoCjdg+gHe4lBwQijzaKhIoX7SM+x7xjnKzaQyHo8UMTTVGWhq1yF1bygNP1h0sly6ZdK7j14SE/YA29I3ejdlPTno5FvZNxrOc/MwqgXb6V6KAxbsAg8fpWV5kYZUkDdZVS2LOjbK4G9S1fqCc+wDM/8JO+kj1rBaQlOK/hTeseYomIF/qVsP3reYRxkHITZ1QourKz4EhAylpr+QZai9Nz/jDTfRsPHk9T+oaqavuxJMSyBCzGrmVweUgmfoCwP4IMs6lJEg2bid22e864O1xa9AyKATfqp/35oYGZL0LAm0es5kfyMYvLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1793998059; c=relaxed/simple;
	bh=ISbxzzFvPz8AJAPlbKjgJ4ch1EuDJZAky23ejdXXZlM=;
	h=Date:In-Reply-To:Subject:From:To:Cc:References; b=gkhAPJuDgHe3scJBsVOAE6gMFe+nY1FCuZAzz5ChBxbHl+itPkOjXyOFjcmF1ATzOtuQwGJmjCKm1lE2gyHq8HUKetQSHZ5ZgKdHqv1yfE/ONWF1tOZAu6qtfiXBEJsZFmwbaaFFLMZDJZJG3EgPqiPDjs5EM6wUbkoWpZUut7D6ZNMKHeV9n7oG9X+cWaicvnivu/IcgxaOkkrz5OTJvN39+lqkkgnzBmpxiFYe5uyrwAGvh66K+iGbO1jrWOacLeQBWvk4D9tflXoWH+VgW+7XUJIPD9FeXN57fx0IQdXYdnC9JS934OhZTw+dclwOTSsbgnxtnQV6Chey5tZe8A==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=8alias.com; s=dkim;
	t=1793998059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmJVTWntV63RZ2uvqGPxtFoOxC4SVuuxuL+a6hSbhNM=;
	b=HMUNNLMWzAOdBC3ce1uL1KKtuUcAPENtMh6xiRYhIQYBvY3bTq+8hfEbX4O55ZnKMfCWjy
	G+S8mBUck2mmyA7Wcfzukc/M1G7TvbKlECNwrNbxK2n86p2KbazOYOXxhmlM5f5igfdy9L
	BIGyDT/DeFF3mLEhMIadLKekxiemHOI=
Date: Fri, 6 Nov 2026 21:47:37 +0100 (CET)
In-Reply-To: <3drvkgys7dre5tegwquecgcwezxw46u3trp7rhjtmzgdvqyeca@steei6i2cskt>
Subject: Re: [PATCH] ti: tas2781: Add firmware names for ASUS models
 without
 a speaker ID
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
From: linux-kernel.supreme403@8alias.com
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,baojun.xu@ti.com,Shenghao Ding
 <shenghao-ding@ti.com>
Message-ID: <179399805883.7.12517291827121133057.1752646207@8alias.com>
References: <179396478879.8.13751503013951596382.1751156862@8alias.com>
 <3drvkgys7dre5tegwquecgcwezxw46u3trp7rhjtmzgdvqyeca@steei6i2cskt>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1752646213
X-SimpleLogin-Want-Signing: yes
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hi Dmitry,

Please use assembledev as the author name and add my sign-off:

Signed-off-by: assembledev <linux-kernel.supreme403@8alias.com>

Thanks,
assembledev

> On Fri, Nov 06, 2026 at 12:33:07PM +0100, linux-kernel.supreme403@8alias.com wrote:
>
>> The TAS2781 HDA driver builds the DSP firmware filename from the codec
>> subsystem ID and, when available, the speaker ID read through a GPIO.
>> For ASUS TP3607SA (1043:3e30), it chooses:
>>
>>  speaker ID 0:       TAS2XXX3E300.bin
>>  speaker ID 1:       TAS2XXX3E301.bin
>>  ID unavailable:     TAS2XXX3E30.bin
>>
>> On TP3607SA with BIOS 308 and Linux 6.18.59, the GPIO lookup returns
>> -ENOENT. The TAS2781 device in ASUS's BIOS 308 ACPI tables defines only
>> I2C resources. The driver therefore requests TAS2XXX3E30.bin, which
>> linux-firmware lacks.
>>
>> ASUS TP3407SA (1043:10a4) uses the same naming rule and needs
>> TAS2XXX10A4.bin when the speaker ID is unavailable. Unsuffixed aliases
>> have been used successfully on both models.
>>
>> The patch below adds the two names requested in this case:
>>
>>  TAS2XXX10A4.bin -> ti/audio/tas2781/TAS2XXX10A40.bin
>>  TAS2XXX3E30.bin -> ti/audio/tas2781/TAS2XXX3E300.bin
>>
>> For each model, the speaker-ID 0 and 1 binaries are byte-identical, so
>> either variant provides the same firmware contents for the unsuffixed
>> name. These links let both models load their DSP firmware automatically.
>>
>
> 1. Missing "Signed-off-by: author information"
>
>
> -- 
> With best wishes
> Dmitry
>


