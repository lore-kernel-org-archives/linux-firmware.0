Return-Path: <bounce+a91e02.be9e4a-linux-firmware=kernel.org@codeaurora.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D7CC433F5
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Dec 2021 04:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 77A2BC36AE9; Fri, 17 Dec 2021 04:47:31 +0000 (UTC)
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83D85C36AE1
	for <linux-firmware@kernel.org>; Fri, 17 Dec 2021 04:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83D85C36AE1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mg.codeaurora.org
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1639716450; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=sjcDemWt9m6u7UIiizqvymxB2YjN3do/BNd0sX4plEw=; b=d5uBVdis095rFmbDAF0EjJsyeLBpEqpBeABY5UFbNd5v21T11jwcgYtH4hcEdgWEikvvhM+e
 Ur565ej+tEsJum2j3L4FaW5dsGYRZ7LyX+ymBteH9UphDL4ay5FJVNR3h1SDjyum1mPqn4Db
 JdHbH3aqBtkNV+IuUm1Vdeu43D4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3Mjk1MCIsICJsaW51eC1maXJtd2FyZUBrZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 61bc165f7d878c8dedef2acd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Dec 2021 04:47:27
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
	id 52BFFC4360C; Fri, 17 Dec 2021 04:47:26 +0000 (UTC)
Received: from [10.231.195.33] (unknown [180.166.53.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: zijuhu)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 96C44C4338F;
	Fri, 17 Dec 2021 04:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 96C44C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: QCA Bluetooth WCN685x firmware pull request
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>,
 Rocky Liao <rjliao@codeaurora.org>, tjiang@codeaurora.org,
 Zijun Hu <quic_zijuhu@quicinc.com>
References: <e270c9f1-d052-c40b-1d9e-f380f60a5a4f@codeaurora.org>
 <CA+5PVA4ZK9dVxMEP_zi=OW6TNQmiBKDWnS6+Vz7hYB9ezX2U4Q@mail.gmail.com>
From: Zijun Hu <zijuhu@codeaurora.org>
Message-ID: <82e89316-bc66-b56a-a57f-8d168575a767@codeaurora.org>
Date: Fri, 17 Dec 2021 12:47:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CA+5PVA4ZK9dVxMEP_zi=OW6TNQmiBKDWnS6+Vz7hYB9ezX2U4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Josh,
i have solved the conflict and update pull request as following.
could you pull again? 

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if you have any problems.

The following changes since commit
commit f682ecb015df087613f91872712eb6c0f6c998a8
    Merge https://github.com/pkshih/linux-firmware into main (Thu Dec 16 09:42:51 2021 -0500)

are available in the Git repository at:

   https://github.com/zijun-hu/qca-btfw.git

for you to fetch changes up to 1500362ad671e202a0ccec37064528395daf5936:
----------------------------------------------------------------
Zijun Hu (1):
        QCA: Update Bluetooth WCN685x firmware to 2.1.0-00298 (Fri Dec 17 12:28:26 2021 +0800)


On 12/16/2021 10:46 PM, Josh Boyer wrote:
> This conflicts with the update I just pulled from tjiang.
> 
> remote: Enumerating objects: 7, done.
> remote: Counting objects: 100% (7/7), done.
> remote: Compressing objects: 100% (3/3), done.
> remote: Total 7 (delta 4), reused 7 (delta 4), pack-reused 0
> Unpacking objects: 100% (7/7), 81.20 KiB | 1.14 MiB/s, done.
> From https://github.com/zijun-hu/qca-btfw
>  * branch            HEAD       -> FETCH_HEAD
> warning: Cannot merge binary files: qca/nvm_usb_00130201.bin (HEAD vs.
> 2d86903a10c2b06fdc84141167030931ac973a3f)
> CONFLICT (add/add): Merge conflict in qca/nvm_usb_00130201.bin
> Auto-merging qca/nvm_usb_00130201.bin
> Auto-merging WHENCE
> Automatic merge failed; fix conflicts and then commit the result.
> 
> Can you discuss and see if it's needed?
> 
> josh
> 
> On Thu, Dec 16, 2021 at 3:56 AM Zijun Hu <zijuhu@codeaurora.org> wrote:
>>
>> Hi linux-firmware maintainers,
>>
>> Here's a pull request for btqca bluetooth driver. Please let me know if you have any problems.
>>
>> The following changes since commit
>> commit b0e898fbaf377c99a36aac6fdeb7250003648ca4
>>     linux-firmware: Update firmware file for Intel Bluetooth 9462 (Tue Nov 23 10:29:13 2021 +0530)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/zijun-hu/qca-btfw.git
>>
>> for you to fetch changes up to 2d86903a10c2b06fdc84141167030931ac973a3f:
>> ----------------------------------------------------------------
>> Zijun Hu (1):
>>         QCA: Update Bluetooth WCN685x firmware to 2.1.0-00297 (Thu Dec 9 16:09:53 2021 +0800)
