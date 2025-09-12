Return-Path: <superm1@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCC4CAC582
	for <linux-firmware@archiver.kernel.org>; Fri, 12 Sep 2025 16:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5DFD7C4CEF8; Fri, 12 Sep 2025 16:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E964BC4CEF1;
	Fri, 12 Sep 2025 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757693554;
	bh=sFSzuZoL/Qn7kKYk1IFRkVKSNDSRgGpU2nE5BCvJLlw=;
	h=Date:Subject:List-Id:To:References:From:In-Reply-To:From;
	b=nCkuEaAZp4A273t+eD66RpNBAzAocbvbnkJ984976uhVQrPQ8WRrdqurjezh7UKAX
	 KmZzQCWMfv3/+13XuqpB6O/UP2MCeQ2EeWqMI2F860y8imS+BqcoLxu9kqYjCBTLxO
	 Rie7p3/JPeyAC5kymhtRu+ZZ/nDQ+PaKJ222W3bhD+RN2bI5OjvBXaemw616HqsRUd
	 HEVivpSHcCmLhrG89wNRZSpg9pGYaC3mV0D+6+SDqKUSVKkz7QEQRGUKRTJHlPDTu+
	 6cdww3vflvzGNF0BovGGPW2EqQkde6SnJ2UnuU+/N3tflnz+hsR3JF3MNi05SbzpJ0
	 oD4osO13Cx6Rw==
Message-ID: <03975d9d-b9a7-47bb-83cf-6533c18a0402@kernel.org>
Date: Fri, 12 Sep 2025 11:12:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Upstream ACPI fixes
List-Id: <linux-firmware.lore.kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>, linux-firmware@kernel.org
References: <5277e61e-3096-477e-b993-bd955be3306e@tuxedocomputers.com>
Content-Language: en-US
From: "Mario Limonciello (kernel.org)" <superm1@kernel.org>
In-Reply-To: <5277e61e-3096-477e-b993-bd955be3306e@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/2025 9:31 AM, Werner Sembach wrote:
> Hi,
> 
> is there a way to upstream fixed dsdt and ssdt ACPI tables?
> 
> Best regards
> 
> Werner
> 
> 

The linux-firmware repository is specifically for binaries that are 
loaded by kernel drivers in the mainline kernel.

What do you mean upstream DSDT and SSDT ACPI tables?  Where?  What would 
load them?  How would you match them to a machine?

The best place to distribute updated DSDT and SSDT tables is from a BIOS 
update.  There is already linux infrastructure (fwupd / LVFS) that can 
get an updated BIOS binary to the correct machines.

