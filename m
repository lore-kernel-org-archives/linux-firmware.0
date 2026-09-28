Return-Path: <SRS0=PH/A=HU=chromium.org=briannorris@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1293CA5FA2
	for <linux-firmware@archiver.kernel.org>; Mon, 28 Sep 2026 17:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B76621F00893; Mon, 28 Sep 2026 17:55:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.229.43
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790618106;
	b=IMZzVO5hTe+qpBzROOzMJhzeFJgOIyd/Ktw+rAzIb277gYfRNcGvGGueW6wJ+P0RnzmO
	 y104gTxZSqFucXJvRdfK+hSTpEwj9hI2fCNR/n13uPywJKAHXNbMl9HvTcZhzdQRe+JXD
	 QcGvDXgrR6xV8I/0rsbbqrHDHWW3dnSwHQoBaEnH1oYInQBJB64w25kzwDJzRQUHxiyJR
	 iVymLQ+Eih0YvW/Xi9Xi4kcuTx2PlaLQvxfeA2SaxMjFN4ZJNLt1+Az5wubCqDLGK3qkO
	 7dHIv9KdcgSwib2NfCPr8mcXjBP+hmcy3Q6pJ0dt4GU4SANGfyh9IB9SginHI4qDiEQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790618106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6rXX3TlmKxsYP/x7KNn4p7QyzaDs70IAoTaAdnd2VCs=;
	b=Zo5QLkBeBSK3/JR1VprOkCFm4Vg/+kSgg8z8dvJOmSvw/v20Ic8oDLg2Eqv9E4StCztC
	 pvsWZFf0/Qwn528YIErqQs7DQ53PHHTXDcgjL7K9YkYgLT7t3JMFX3+OmRTtrdUmIWMds
	 B8zqNTBOPx8do9zb+WHNK3SfJ9x/HZXW6Y7aJO56kxzA4AQaaPXz1zITXo9AFUGBD+Rit
	 UWIOi8WspmkeXjtIlaNiFg5Jj6h2WExRUCpLlE9BbegQGOMgfpx7pto+pXTaUP89WqoUE
	 HzYNjG6+aXfFhPYOp8yqJJUpkG8dDu1pTsSZuXZqK/fAdEWqrx6ZEBxXXDqGNz5mtoQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ajPex1Oj;
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	arc=none smtp.remote-ip=74.125.229.43
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 189891F000FF
	for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 17:55:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ajPex1Oj
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 189891F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso3443609eec.2
        for <linux-firmware@kernel.org>; Mon, 28 Sep 2026 10:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790618105; x=1791222905; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6rXX3TlmKxsYP/x7KNn4p7QyzaDs70IAoTaAdnd2VCs=;
        b=ajPex1OjIrIFomcCSyJq10i69h3it1F0baCA3SScZSIdZuhWHOsd9WzampJ2mxM8Uv
         u1AHUte6JcW51b8jTREXUNTUFfriNXd/MBRp+NrE7v/Tdg0gyMV8Z+ril0t5i8A+VOrW
         iqWKMLBSGxd4AvPjILXGI/EWf7QXQd+9yIg1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618105; x=1791222905;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6rXX3TlmKxsYP/x7KNn4p7QyzaDs70IAoTaAdnd2VCs=;
        b=Emu2ZNZAKYZ1ttbUwlY4RxtOSAQFM3VQY6r/0O9SaNqI3IK8wDRVRJEEKVHVeM0bYQ
         eT9ESe2trliv+6NgBEAko58E40zH0EhLt74sS6XKEXthgCLJi+ooS0epvuUPIe/pxyuG
         xkwmzcGztHTvV38A8w8stEVhIh2fjoE2RwnJrr7zY22SiHFr3SxMh1twfOshqhomUv3d
         ilq6RtUMtPBuDYA5wIESROdrV2329SF/Gnc3RqmbXF7xRBaGz0FJC+fK0ZfkZtwaHTCl
         c+YgO6FR398Zx12MMOcd+HxR1vaWVImc+kzWOuHdi7a5uEdc/RdnxM8LZYkSz/uTLj6R
         QNKw==
X-Forwarded-Encrypted: i=1; AKwUvBx9Yd++Arz01//9TCihPzTEVz2JWc7Y6nMq+87qPufV2+RLOJqLTRsZPXi0FmNWu74hBuJi96goDWcDAM/xjA==@kernel.org
X-Gm-Message-State: AFq9FYKKT8Lw7oBjCosvxJJkNmZOn8zG0hfaspaXiNlNkX7OkPp0qF77
	lrbPrUURjqqAjJE036vwrmMHUI7hbi9bfptHdVFB2xH1G41AfyRMRrf6sCtUH8/MQQ==
X-Gm-Gg: AYBFou3Pd7wdJ7YNYXa2OEbQBJi+zEmkS0o0IbhdpD58q511CT5Tt3aYPPRsSXg1e0t
	yq8IkRgqSmW2+TQS2pG5q9iDUbyNTWeHLG26m+md3mOHPw2bANhJ8GWa9k+ynL+nv9Spv5Sf9FE
	0OxenXtMNRZOklaIUqMTQXGPSpkLpALRNHUYDIUi6cgv+SvvwPJ/okZqKBMcsCLTbE5U3z+0lFS
	sjVLTsLZzJQOURDmZkEiE2WyRHvQX9Kk69y+Bvlk8eOs6hmY89/TG2+h4zVrrrgAqW2UOA3mt5T
	HDvJV8urBSuNjyuzbO5JI8NdJWg+ndiwnty9/U4Nutyn/ppSOAjs/WJIWx7FAB2lg4drbHpvvWQ
	rlHu9FNEpnNKB4CelJ9DiHaNApjzKPUH3riCNW0RBWmT4YDqLs/6u0bPxcgLZhRDh26OZOmFVBT
	PE5UDwv2eqYhitIrBu/KBqRI2fDV40aBCTdVpjAP9WJkgQB/q6zBNfa5/ucB9q+3o9XV8NUUiJB
	TmTHMkGu0c0M4piwx+wc7dQnts4cSef2Z6vlQ==
X-Received: by 2002:a05:7300:7313:b0:33b:dd45:716c with SMTP id 5a478bee46e88-34270bc0851mr15186191eec.13.1790618103931;
        Mon, 28 Sep 2026 10:55:03 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:a706:cad8:8223:aefa])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-34145c17074sm27542619eec.26.2026.09.28.10.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:55:03 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:54:54 -0700
From: Brian Norris <briannorris@chromium.org>
To: Andreas Kemnade <andreas@kemnade.info>
List-Id: <linux-firmware.lore.kernel.org>
Cc: David Lin <yu-hao.lin@nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>,
	=?utf-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@protonmail.ch>,
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"lukas@wunner.de" <lukas@wunner.de>
Subject: Re: [EXT] Re: mwifiex firmware mrvl/sd8987_uapsta.bin missing in the
 firmware git
Message-ID: <arqp7k55wqW5ZgCV@google.com>
References: <20240605160013.6bea8d4d@aktux>
 <_pNnwoI9WHlb2EY635KdIv6t_goU-ZYp9Vav31jkFOCf9fCE9EeKdyCea2m-L8pgfsKIQvODlnQLhQqmWSYip9e6FFZwaJHL5-u5rdOS_kY=@protonmail.ch>
 <20240605174709.5043af8f@akair>
 <20240606101839.GA76158@francesco-nb>
 <PA4PR04MB9638D1FD47BFBFDDB096C778D1C02@PA4PR04MB9638.eurprd04.prod.outlook.com>
 <ZmlEny2W0nArOf1T@gaggiata.pivistrello.it>
 <PA4PR04MB96381A69AD86ED9C9E4AD9CDD1CD2@PA4PR04MB9638.eurprd04.prod.outlook.com>
 <20260925165814.567c9ab7@kemnade.info>
 <arag95IJHR5FiFo9@google.com>
 <20260926090026.22b00f57@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260926090026.22b00f57@kemnade.info>

On Sat, Sep 26, 2026 at 09:00:26AM +0200, Andreas Kemnade wrote:
> There are rules what licenses might forbid and what not in LICENSE-CRITERIA.md.

Ohhh, nice. I was looking for exactly such a file, but I was looking at
a too-old copy of linux-firmware.git -- that seems to have appeared in
the last few months.

> At least submitting it to the firmware repo (so from NXP sight a third
> party repo) sounds like some permission for distribution.

Reading that doc: actually, no, that doc seems to suggest otherwise. It
specifically delineates various "terms that will cause rejection", and
it seems the current NXP license triggers several of those. NXP would
almost certainly need to provide an updated license, not just a sign-off
with their existing license.

This seems entirely up to NXP to unblock. If they want to work within
the open source community, then they need to learn to work with the
rules of that community.

Brian
