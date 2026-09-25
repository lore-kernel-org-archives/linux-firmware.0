Return-Path: <SRS0=SY9z=HR=chromium.org=briannorris@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1330C9830E
	for <linux-firmware@archiver.kernel.org>; Fri, 25 Sep 2026 16:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1BAA1F00898; Fri, 25 Sep 2026 16:27:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.227.140
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790353659;
	b=tG4ZumB4iLb7JGx8VEtxuZQ6EZ5Ko9K7eidbvLJp+w7PKWwiFhaKoXkQx7WosLS3mYlo
	 n2gYTngP2Wd208C0bT3BXLHCIrzj0mn4NlMrrtUQTgTm7OHlsrSS+4WF+y+rxFOyBiv5/
	 53PxPegpEur6CNDDnLwlI3siJ8QuVxwWkEK3VlkFmipIweY8JxYv/aWvPtbNAd8G/eDjN
	 2BlgeUVeAAgBBkV4Rtdb0Y94F6rd+hafC58cSsv7Z/axv20Zqun91IYCF5imNXxgEtNKy
	 7m/mVlr1wX6DYQ88ibr8lY7h/jeHzVuZL1xjh6yAAbxkdL3MrRw8puoKYc+HU/Z80Ww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790353659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:List-Id:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NilrANqlAP1Fe7hZ7FMLKoK+ykSYxjyywmx2s4rB6mE=;
	b=XcURUZjjm5ZVCsp6VMvXN5z0fP+YFQagliTV3Kc0spybWMVcbI1WXmGWqAE3mbuIf1fM
	 1MTGXGRiP1cq+r+alEMvXT3HQF7r4lk5q6tEesYERbN0HR/97EtARU+0kA1XJ9ktzEQQf
	 KrGzaHmZ0TRy/a6eg0bxqvK1FwKMv+bFMnhBo6rQYtto282Xu84TnzXzjs1Imx/eZ0ksm
	 lN2DU9iEgFsiHYLl+8A8mt/X2znk//aiZtz282SUybtJ2yrex/IxISX6/wYG57/RDI2kN
	 ralxV341zjzJQg0QtB3vBevQOdNnjrmuTV6xuwG+Qwbd/dTUDMnaREqkCNNWQdsHU+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gEjxZyeL;
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	arc=none smtp.remote-ip=74.125.227.140
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF9381F00893
	for <linux-firmware@kernel.org>; Fri, 25 Sep 2026 16:27:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gEjxZyeL
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DF9381F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb752so634362a91.0
        for <linux-firmware@kernel.org>; Fri, 25 Sep 2026 09:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790353658; x=1790958458; darn=kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NilrANqlAP1Fe7hZ7FMLKoK+ykSYxjyywmx2s4rB6mE=;
        b=gEjxZyeL+qYCg8RtBSzlOIXNYOwLzQnm+bUDCthoV9blVr0iGo2U9QHIy66iasIasM
         31CWdBIxiTJzsPMO0hp37XIMPjmMKdNW/zJWbiZ+jD+MCVIs3XYHeNfDKE+q7G6zjtQ+
         UaYTN+sEKAakPA9Vz63Kl/JTp3G3BiSxnKQmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790353658; x=1790958458;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NilrANqlAP1Fe7hZ7FMLKoK+ykSYxjyywmx2s4rB6mE=;
        b=GQ9ULBSGEzHbkxfDEX6VlVVOcJ7wt0jVD/noQv0/cJ/1BAD8eRRT3snG0KSbwGO1Ko
         nKa54wV7CaFHS8loP51A9BBRnGA80hV1Omoo2ABQ4U7MWiU3OFClchqt2ak9VA7CjaP5
         uA96TSk9AHsRHaA7pL+BQmAmZ5FZCsKbGktmTuv3htpJLHNvpwjFzMIULNbJQsRIObkb
         kUjNBFhZ75WisfBal9N8I3weXz3dWNn65C/srnMXj1ZHfkyRIEJqbBiMWir6STafbgdo
         yuiiEqgp+TryBrvmMUQxwM8ULd2PjBTXj7UBybFjEnUiCh4YjXONe2p/99CMYLoN2QM0
         LOLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMIpgK+6SGHMzB8bvt+cUJfBEPQi4Ty1btZb8CkzD3cN+a5ZrZ9CPbLGKs5d7iKvm2TQOFv+NI7zYxMRpRbw==@kernel.org
X-Gm-Message-State: AFuF++nF6s0Sy+iIghbUxsYJV0P3S9CeS45ACE7o/OBxdJFBYPFe0zKJ
	3cUL7aZ77vL21B5d5sRXuNJf/uHcbn9CgeGoNSShn//QGBxQXw40w9Gra6k1XoFg9A==
X-Gm-Gg: AYBFou0vWn7XnrSIZMSgMkBq3nnHAnrlr7ZuaXiRNNQCAlwMfLmi46NDWHd9F8s4eAk
	dlXfhC1xz2aMYyKhtWAyzlhdYitEgxSDgWf1Xlasvq/Pj8sDXOFB9iWrOZ2CEBdVFHFGu5+EVii
	NL027BBkeepcsR9UUPEwYI0cW1pQe+LDD7uafkLyXlLuhZnqHoAm1OcCIjN+vAVZhvLXtoqOF44
	KwrgRrZeui7+wTtsFlDOxR0kacoxVgGc6tDWXaMn5VBcgLahrdFb31PomHpExKW+//NLtIVnsO/
	hjxtAAcXR0AYJMgopEaf909oo+UTrBpeju3FksZe9AMWH6WupUU0fTZDaDfepld3Bv+tMCpIU38
	GDDVGkncT4iqEHqS/VP/BdHugXc1KQB+wIsoAzGpu/w1+AXrbUIPkLnpN+tZKWlIFkyqQRIlE7j
	1wITLaSbGHqWc4eqXJzqoT14o/1ub6Arod7e6lYUcvIABNf0+I4cSETmbe5uKwmD7lGGV+LdwDv
	3Ew1RjT+LXYfViCYZvNMoMdncXBpkb6XY30AA==
X-Received: by 2002:a17:90b:1c03:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-3a098537e9bmr5607586a91.5.1790353658186;
        Fri, 25 Sep 2026 09:27:38 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:41fb:1648:4395:5cc4])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3a0b9355e49sm5409547a91.4.2026.09.25.09.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 09:27:37 -0700 (PDT)
Date: Fri, 25 Sep 2026 09:27:35 -0700
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
Message-ID: <arag95IJHR5FiFo9@google.com>
References: <20240605160013.6bea8d4d@aktux>
 <_pNnwoI9WHlb2EY635KdIv6t_goU-ZYp9Vav31jkFOCf9fCE9EeKdyCea2m-L8pgfsKIQvODlnQLhQqmWSYip9e6FFZwaJHL5-u5rdOS_kY=@protonmail.ch>
 <20240605174709.5043af8f@akair>
 <20240606101839.GA76158@francesco-nb>
 <PA4PR04MB9638D1FD47BFBFDDB096C778D1C02@PA4PR04MB9638.eurprd04.prod.outlook.com>
 <ZmlEny2W0nArOf1T@gaggiata.pivistrello.it>
 <PA4PR04MB96381A69AD86ED9C9E4AD9CDD1CD2@PA4PR04MB9638.eurprd04.prod.outlook.com>
 <20260925165814.567c9ab7@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925165814.567c9ab7@kemnade.info>

On Fri, Sep 25, 2026 at 04:58:14PM +0200, Andreas Kemnade wrote:
> The License terms have in 2.3(b):
> "(b)     to copy and distribute as needed, solely in connection with an
> Authorized System and for use in combination with a NXP Product,"
> 
> If I read it correctly, the firmware cannot life in such a repository, since
> the repository is used by different machines. Is my interpretation correct?

I'm no expert and am not providing legal advice.

I see there is some roughly similar (but a little weaker-sounding)
language in some existing linux-firmware licenses. e.g., "permitted
solely operating in conjunction with <company> authorized products".

I also see the linux-firmware README only says:

    Your commit **must** contain a `Signed-Off-By:` from someone authoritative on
    the licensing of the firmware in question (i.e. from within the company
    that owns the code).

I take that to mean that linux-firmware doesn't really try to own the
licensing rules. They defer to the company that owns the IP.

So if NXP wants to submit things to linux-firmware (or "sign off" and
hand it to someone else), they might be able to do so. YMMV if you're
not an NXP employee though.

Brian
