Return-Path: <SRS0=ON9Y=7T=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DE8D31A26
	for <linux-firmware@archiver.kernel.org>; Wed, 14 Jan 2026 08:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9524AC19423; Wed, 14 Jan 2026 08:10:47 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7883C4CEF7
	for <linux-firmware@kernel.org>; Wed, 14 Jan 2026 08:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7883C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4327778df7fso5200364f8f.3
        for <linux-firmware@kernel.org>; Wed, 14 Jan 2026 00:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768378245; x=1768983045; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iyQ7CAxaVgfqcnEakSL72b/nQ33nYsikOLFTzPcqfjI=;
        b=Chk3vRv/hhPv92dSACnxAVulwO75VegUWt4DeIMWsveRHgMIsZ5+E8aG1c3Uc0FDlG
         OUNuA3u13fZDbBBWQ2gre17DwUb+/7PgYWq3qF3pWnoYNCttASjstBgJ8VVOKmwtetXz
         mygr3pCXlRuX+dVdoDWRamdE8Jx/K73WW+gtNkfpl7Yfb1mYyck0EHL8tK/NIxMutw9S
         b9iPXztYlH1oBZgaLHyRblP95LChAxZd2jAacXKP9J15XW0LDNwpJsSIjujxKccL/7Iz
         g2dpa9MpBQ7pTygSrcKmV7PU+xTumQZu8aehR/Mo/dqDA6cSQzt5WrO9NdbD+R+iA9zJ
         xUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768378245; x=1768983045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iyQ7CAxaVgfqcnEakSL72b/nQ33nYsikOLFTzPcqfjI=;
        b=sUwN+4dcWGvNV1E4TXmmZ6FSau7P0ZdcY8sd09zalg1sYyhtwlHT1POxksnlo1KceB
         SFktDPI73MRscfqsQvyvCzn5flE1WoFeIIoF8xLpx6MRLorgwqhsNIJo1QjxmqL1ezkD
         GMLNANRvXO09fwhMiQYqtL04udRSSEpYROx6HX0Hd1zfEZ7LPZ6qLhsbAA/6VRkjxgbO
         ZPYK2TsFetENQ5g/S3IT2nGntLaOm7kyDDaoED/vcYJohdFb+mulLHrnX6BB6HAeNH4u
         oTw3t9L0G47R+tYzXPr6fW1vWLXVU4TeBk1OnDYzHu9UndaTsg7hw45dMB6n4jfoQLCv
         xvfw==
X-Forwarded-Encrypted: i=1; AJvYcCVBcq6y1XVgRNHrij/QA2NzuFmnUYURflnjbFSGgms8kyvGpdkROmNl0YU1r0EartBdNkQaYMORDI9qtL9VxQ==@kernel.org
X-Gm-Message-State: AOJu0YyBquoa04FW05n2k0NKWJJge+e34DmH35qfv7NeHW4hABpGAE0P
	iIzVSy730HaMztLNVJ2cSGm2lrTe8yYntu4fkbM9dfD3Twnuw3VWdg2w
X-Gm-Gg: AY/fxX6a67CiO7rRrGtX2MrpvcWnwK4PHzaEysc8CMtYCpzWYyfaLwriu9iNHxw5jfQ
	hPpLvz+k5uoeU3M67J6dCCDVkD12E/MVcbqfHMGl38j57hSeAMPg/Rpj7V//ysZ9BeiiyIx586s
	74CkuC86TYhf/7zKu50FC9xeDenvqFubkC+Y7LZz4uwYSdQtOBCqA/5/27awWOP1uuTiV1sgzwH
	H5uKX4b9YS1EZizhb9nM6yRM9gSMHj94XST+JPYdLFbH/kiVja3CdzYr6apmW5nwPNdykb8w3xE
	BSeKQfbFjCCHWydcsgQcz3bqUw/rGr8mGGqA/ZJWHdi9eQ27/W83dytVSmzAdsWc/J3TQYqs+tb
	V6V7QTVQ3cTLNouv3BS+4cBynNI1s4G47h5RoqAJpN/kM22vUGp3O/MIjwTyxPyresG+skHv1Q6
	4JIiuKcpI3ktZ28FrrhBN6KtajO8xulLCBsNQYDwmA5IfPYtdRtDCfXVdCKjpmJd/b2lk=
X-Received: by 2002:a05:6000:4024:b0:432:5ce4:6fed with SMTP id ffacd0b85a97d-4342c4f3f3bmr1574271f8f.9.1768378244853;
        Wed, 14 Jan 2026 00:10:44 -0800 (PST)
Received: from [192.168.1.27] (84.121.134.198.dyn.user.ono.com. [84.121.134.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edd51sm48599398f8f.29.2026.01.14.00.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 00:10:43 -0800 (PST)
Message-ID: <0c93f704-40a2-4257-b834-8d0f3c50f2ee@gmail.com>
Date: Wed, 14 Jan 2026 09:10:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] mediatek: rename MT8188 SCP firmware
List-Id: <linux-firmware.lore.kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>, linux-firmware@kernel.org
Cc: linux-mediatek@lists.infradead.org, nfraprado@collabora.com,
 Jason-ch.Chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 Macpaul.Lin@mediatek.com
References: <20260114072433.3076970-1-moudy.ho@mediatek.com>
 <20260114072433.3076970-2-moudy.ho@mediatek.com>
Content-Language: en-GB
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20260114072433.3076970-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/1/26 08:23, Moudy Ho wrote:
> The MT8188 device tree (DTS) is configured for dual core SCP, and the
> driver by default attempts to load "scp_c0.img" as the core 0 firmware.
> To conform with upstream naming conventions, this patch renames the
> existing firmware file "scp.img" to "scp_c0.img" to ensure proper firmware
> loading for dual core SCP.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   WHENCE                                  |   3 ++-
>   mediatek/mt8188/{scp.img => scp_c0.img} | Bin
>   2 files changed, 2 insertions(+), 1 deletion(-)
>   rename mediatek/mt8188/{scp.img => scp_c0.img} (100%)
> 
> diff --git a/WHENCE b/WHENCE
> index 4a211c48..fecf42f8 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -6057,7 +6057,8 @@ File: mediatek/mt8192/scp.img
>   Version: v2.0.20536
>   File: mediatek/mt8195/scp.img
>   Version: v2.0.21961
> -File: mediatek/mt8188/scp.img
> +File: mediatek/mt8188/scp_c0.img
> +Link: mediatek/mt8188/scp.img -> scp_c0.img
>   Version: v2.0.27748
>   File: mediatek/mt8189/scp.img
>   Version: v1.0.0
> diff --git a/mediatek/mt8188/scp.img b/mediatek/mt8188/scp_c0.img
> similarity index 100%
> rename from mediatek/mt8188/scp.img
> rename to mediatek/mt8188/scp_c0.img

