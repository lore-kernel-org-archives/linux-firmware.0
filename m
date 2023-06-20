Return-Path: <patchwork-bot+bluetooth@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E277CEB64D7
	for <linux-firmware@archiver.kernel.org>; Tue, 20 Jun 2023 18:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B11B0C43397; Tue, 20 Jun 2023 18:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F779C433C0;
	Tue, 20 Jun 2023 18:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687285824;
	bh=HxZnjIyFAPTe9okDAsuQgq9QyLZCXLuFoM8Lad5rKvI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pioBT6jn88C/afqFAYi9AoYmgOGva2ULma/HiHSAUTWl+qNe2GkIiSFGs+zy64Xl7
	 +Vvy8wRPBZntH5Teh+UKcvGcOlOTyNvPdT1CoP+O6q8HhouTw+82tbrwsEIWNn0B4J
	 VLRff0M6/Iv8Gm2tebVM5N+E9LEscusFu0D8j3aA9ugdUKq9vRpZ31QYt8r9hHU2yX
	 aGV6FrLR7O0Bp9OGagbLrkrf39qObpROsZy1sEG/8kq0y4a9YiHUnJ/QXojXGgxTvZ
	 jQjyG9Cgl0CZ7ZOU0AN+VKryX/gKopMaeky6UQUeaVPjVTaluht6YsdQ33x83vxQXz
	 75NniX10Ecdaw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6F9F9E2A035;
	Tue, 20 Jun 2023 18:30:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] Bluetooth: btusb: Add support Mediatek MT7925
From: patchwork-bot+bluetooth@kernel.org
Message-Id: 
 <168728582445.12887.8722282990110428920.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 18:30:24 +0000
References: <20230620082750.9218-1-peter.tsao@mediatek.com>
In-Reply-To: <20230620082750.9218-1-peter.tsao@mediatek.com>
To: Peter Tsao <peter.tsao@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: jwboyer@kernel.org, dwmw2@infradead.org, ben@decadent.org.uk,
 marcel@holtmann.org, johan.hedberg@gmail.com, chris.lu@mediatek.com,
 sean.wang@mediatek.com, deren.Wu@mediatek.com, aaron.hou@mediatek.com,
 steve.lee@mediatek.com, linux-bluetooth@vger.kernel.org,
 linux-firmware@kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Tue, 20 Jun 2023 16:27:50 +0800 you wrote:
> This patch is added support Mediatek MT7925.
> 1. The firmware location of MT7925 will set to
> /lib/firmware/mediatek/mt7925
> 2. Add Mediatek private data in hdev
> to record the device for handle MT7925 flow.
> 3. Use the recoreded dev_id to condition chip reset flow.
> 
> [...]

Here is the summary with links:
  - [v4] Bluetooth: btusb: Add support Mediatek MT7925
    https://git.kernel.org/bluetooth/bluetooth-next/c/631016e6154d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


