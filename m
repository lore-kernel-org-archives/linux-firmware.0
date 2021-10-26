Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889F9C433EF
	for <linux-firmware@archiver.kernel.org>; Tue, 26 Oct 2021 03:19:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5D7236103B; Tue, 26 Oct 2021 03:19:43 +0000 (UTC)
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52C6361074
	for <linux-firmware@kernel.org>; Tue, 26 Oct 2021 03:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52C6361074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635218383; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=F1GJoBWHgg6BrzJbLCb2MNEHp0Hrf0W4HiEGsXnaR74=;
 b=nBaMY8Dbj+fYefeD6KReqJMxYgt2KAkBY5byiDFSk1UyxGqCYbP5TS9PCPFgHUEF82Lv9gaD
 J6u2swpmS32qeiKIoh2EWrfEemBp9UJ3xZC/9wTq5lD4B+EZMK0YbXd6q0ZeQJI3EuOLgva9
 ePZHvkfAni4+GHhldACliJCbC+0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 617773c4fd91319f0f9d8e00 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 03:19:32
 GMT
Sender: rjliao=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 68D98C43460; Tue, 26 Oct 2021 03:19:32 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: rjliao)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 1C9ECC4338F;
	Tue, 26 Oct 2021 03:19:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 26 Oct 2021 11:19:32 +0800
From: Rocky Liao <rjliao@codeaurora.org>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Subject: Re: btqca firmware 20211019
In-Reply-To: <CA+5PVA4YdACvgNPUSE-w-x6HUa9nX-gz6RPkimj6htZ-edanUQ@mail.gmail.com>
References: <ce803519aaf7feb5845bc694ceb55b1d@codeaurora.org>
 <CA+5PVA4YdACvgNPUSE-w-x6HUa9nX-gz6RPkimj6htZ-edanUQ@mail.gmail.com>
Message-ID: <51d8f88a8118d2aa7da78f7eeee68717@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

Hi,

Updated, the new commit id is: 582c9da3e47b41f6a2620fd76d650f9d69de54fe


在 2021-10-25 19:17，Josh Boyer 写道：
> On Tue, Oct 19, 2021 at 4:11 AM Rocky Liao <rjliao@codeaurora.org> 
> wrote:
>> 
>> Hi linux-firmware maintainers,
>> 
>> Here's a pull request for btqca bluetooth driver. Please let me know 
>> if
>> you have any problems.
> 
> qca/nvm_usb_00130200_0109.bin is a new file and needs to be added to
> WHENCE.  Can you please adjust and resend the pull request when it's
> fixed?
> 
> josh
> 
>> The following changes since commit
>> d34196f55db16f2344483f94718c2b2263a5489e:
>> 
>>     linux-firmware: update firmware for MT7921 WiFi device (Mon Oct 18
>> 13:11:16 2021 +0800)
>> 
>> are available in the Git repository at:
>> 
>>     https://github.com/rjliao-qca/qca-btfw.git
>> 
>> for you to fetch changes up to 
>> c2e1fd30d91e22f9540f8253f1890c06cbba1a75:
>> ----------------------------------------------------------------
>> Rocky Liao (1):
>>          QCA: Update Bluetooth firmware for WCN685x (Tue Oct 19 
>> 16:00:42
>> 2021 +0800)
