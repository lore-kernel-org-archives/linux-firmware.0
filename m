Return-Path: <SRS0=qOH8=QO=leemhuis.info=regressions@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20785C3ABB2
	for <linux-firmware@archiver.kernel.org>; Mon, 16 Sep 2024 12:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12317C4CEC4; Mon, 16 Sep 2024 12:53:34 +0000 (UTC)
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87C4DC4CEC7
	for <linux-firmware@kernel.org>; Mon, 16 Sep 2024 12:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87C4DC4CEC7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=tMiUCsbSqV0wJLr8aEI7gjZHztOn8RrLSIUojGSjbP4=;
	t=1726491212; x=1726923212; b=BjqVUNxJSuzvWtiUXwFVxGQiKKTMd5drK2SDh8vXdx5v5DF
	e1jof6x60TsYMeZiF5z0g/NbCwAlSuGB3MyTl8Y0y2ef0QmdjchuDyZuftVh9ckbToyh7f6zzmfVe
	rBdBhRXa6qUiX6IqP7YyErxhyEWkuE2g3wFo+8rVHHzV8MLKBZp439TjksYt1sFTyyD+yaYoJzbjL
	9/5PRdxara4+dltXqZveF3gHT8p7yoU50MHfjxnN57fLyb1QlnNO8Gu4Qh28nf/WqeSsnOXydjv81
	eq+eVbGZ11IloLCBqvIfSIQHWZNPDqrkIfHCYD/nY73GFLDmDFTkOppUSNRgcDfA==;
Received: from [88.128.88.10] (helo=[10.226.192.63]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sqBEG-0003cI-Ux; Mon, 16 Sep 2024 14:53:22 +0200
Message-ID: <a6ea491c-f238-4c84-a51a-3304f6781468@leemhuis.info>
Date: Mon, 16 Sep 2024 14:53:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Update of linux-firmware breaks wifi on Thinkpad T14
List-Id: <linux-firmware.lore.kernel.org>
To: Christian Heusel <christian@heusel.eu>, linux-firmware@kernel.org,
 Kalle Valo <kvalo@qca.qualcomm.com>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org
References: <44ae68d2-24b6-49d2-a4f9-ae9cbf6f9950@heusel.eu>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <44ae68d2-24b6-49d2-a4f9-ae9cbf6f9950@heusel.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1726491212;44e6644d;
X-HE-SMSGID: 1sqBEG-0003cI-Ux

On 16.09.24 12:49, Christian Heusel wrote:
> 
> the commit 82318c96 ("ath12k: WCN7850 hw2.0: update board-2.bin") in the
> linux firmware repository apparently breaks card recognition in Thinkpad
> T14 laptops with the following journal entries:

TWIMC, another report (that is 5 minutes older :-D ) about this can be
found here: https://lore.kernel.org/all/87bk0nc1yb.wl-tiwai%40suse.de

Ciao, Thorsten

>     Sep 10 12:34:01 gdb-arch-t14-5 kernel: ath12k_pci 0000:02:00.0: failed to fetch board data for bus=pci,vendor=17cb,device=1107,subsystem-vendor=17aa,subsystem>
>     Sep 10 12:34:01 gdb-arch-t14-5 kernel: ath12k_pci 0000:02:00.0: failed to fetch board.bin from WCN7850/hw2.0
>     Sep 10 12:34:01 gdb-arch-t14-5 kernel: ath12k_pci 0000:02:00.0: qmi failed to load bdf:
>     Sep 10 12:34:01 gdb-arch-t14-5 kernel: ath12k_pci 0000:02:00.0: qmi failed to load board data file:-2
> 
> Is there any more information you would need to debug this issue or does
> the above already tell you enough?
> 
> This issue was discovered by Arch Linux Forum user "Mezzy12" with
> debugging help from user "loqs" and me.
> 
> Regards,
> Chris
> 
> [0]: https://bbs.archlinux.org/viewtopic.php?id=299286

