Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC583C433F5
	for <linux-firmware@archiver.kernel.org>; Thu, 13 Jan 2022 08:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5088C36AEA; Thu, 13 Jan 2022 08:12:51 +0000 (UTC)
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39C64C36AE3
	for <linux-firmware@kernel.org>; Thu, 13 Jan 2022 08:12:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 39C64C36AE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1642061571; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hIa/NzWrxEmvAwaea5Iym/wW2IWWXwFY8GYeHfuDNn0=;
 b=j6t9RGEpcdmVAsl2FqrphET7OoQPl92uE7Od4ME5SjlcvdyniSn98RUdE5mRpAGPRu8MmUJj
 xal3ofAmbRr+FhLKGBxz04sKS8Gc2xPfOqLxNIBheIMsAb0hDrlKB9JFPvF/04hw1OMBbA0r
 JJNvggm5X9miIcSao+WR2IoGDs0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 61dfdf029c5d22ce318da00d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 Jan 2022 08:12:50
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 94022C4360D; Thu, 13 Jan 2022 08:12:49 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: zijuhu)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 40558C4338F;
	Thu, 13 Jan 2022 08:12:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 13 Jan 2022 16:12:49 +0800
From: zijuhu@codeaurora.org
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, Rocky Liao
 <rjliao@codeaurora.org>, tjiang@codeaurora.org, Zijun Hu
 <quic_zijuhu@quicinc.com>
Subject: Re: QCA Bluetooth WCN685x firmware pull request at 2022/01/04
In-Reply-To: <CA+5PVA4qFX3Gv_kuWEpe_mof=PE0CGuK4WE3bbbyCkDpPabDFg@mail.gmail.com>
References: <5029a137-0b82-bb66-b1f9-47fd0676aa54@codeaurora.org>
 <CA+5PVA4qFX3Gv_kuWEpe_mof=PE0CGuK4WE3bbbyCkDpPabDFg@mail.gmail.com>
Message-ID: <7c078a1a6a9d5d834b30f252706e517e@codeaurora.org>
X-Sender: zijuhu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9

On 2022-01-07 20:26, Josh Boyer wrote:
> On Tue, Jan 4, 2022 at 4:36 AM Zijun Hu <zijuhu@codeaurora.org> wrote:
>> 
>> Hi linux-firmware maintainers,
>> 
>> Here's a pull request for btqca bluetooth driver. Please let me know 
>> if you have any problems.
>> 
>> The following changes since commit
>> commit 57d6b9507e28ac4803ea4aa4dba9592c889d6733
>>     cnm: add chips&media wave521c firmware. (Mon Dec 27 09:07:08 2021 
>> +0000)
>> 
>> are available in the Git repository at:
>> 
>>    https://github.com/zijun-hu/qca-btfw.git
>> 
>> for you to fetch changes up to 
>> 17fe7809058ad5949c12d80bf446e726f9e9f782:
>> ----------------------------------------------------------------
>> Zijun Hu (1):
>>         QCA: Add Bluetooth nvm file for WCN685x (Tue Jan 4 14:14:51 
>> 2022 +0800)
> 
> There are actually 3 commits on your main branch that will be merged,
> not just this one.  They are:
> 
> 17fe7809058ad5949c12d80bf446e726f9e9f782 QCA: Add Bluetooth nvm file 
> for WCN685x
> 72af07ecad7646f84e49222596ad09bcebe223d9 QCA: Update Bluetooth WCN685x
> 2.1 firmware to 2.1.0-00324
> 7411d2bf5afa895c6440ca2f935a50a74245eee7 QCA: Update Bluetooth WCN685x
> 2.0 firmware to 2.0.0-00609
> 
> Is that what you wanted with this pull request?
yes, there are 3 commits to merge.
thank you
> 
> josh
