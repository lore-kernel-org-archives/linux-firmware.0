Return-Path: <SRS0=xeDI=4T=lists.infradead.org=linux-arm-kernel-bounces+infradead-linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDF9C3F2D1
	for <infradead-linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2020 13:04:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3835217F4
	for <infradead-linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2020 13:04:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dT77ze0Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZwcUXMb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3835217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+infradead-linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0HpZm5lsrqYyGLMAt7vqmioI6VafLDTMox0BG3B/ZI=; b=dT77ze0ZyXfAsp
	zlmG5AQdBtwrceuHYe2lSLq9lZAOKVXdQ2mdVorYMfeGLAEj2uCbzblKegYrTBUmnmBUnHXFVWqbL
	dfGJsbSeJoK2EXh/wLGYltHeRQFiF8lORrJ/+3S9+0htotom9LrsH1ckYvn60R8JK4c+9ENXuERxG
	XLHiZZUF8VGzWJvnpp2pvpg4bRJUGERBZW65g65A/Nlnuf2aSuIsXx+lXDRT1WsW9CNmmo7hOCE74
	003NzRWqyoRbPCDVby7syKlZDfwqTYaNDzkKYTHnUb0sJXZZdQwRYzE+xEcpU6GUgfVpG+FXqE/xC
	CUgmO4iUGfsowDu2knWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8kkj-0005tD-BG; Mon, 02 Mar 2020 13:04:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8kkf-0005sT-Vr; Mon, 02 Mar 2020 13:04:55 +0000
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9AF5217F4;
 Mon,  2 Mar 2020 13:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583154293;
 bh=zxQKUp9bAzSWGADPh22WXwRxVBG3FLzKiQC9/v8nEak=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=bZwcUXMb21InRP9UVL8eRPxE5n1Js8BO6ta+lUCBOu0CsqBpqBfq3qauf0tbZPcwK
 SKkKJzOZCFd0EMcq/3qcLifU8OWDllbNv/GIUmxZ9v0+aBXO0a2iLiTBxXByddbMB5
 2+SyxZB3jfR7xaPgX1ThA2ybBsX3bopsCfakQC/g=
Received: by mail-il1-f182.google.com with SMTP id e8so4558729ilc.13;
 Mon, 02 Mar 2020 05:04:52 -0800 (PST)
X-Gm-Message-State: APjAAAX2ajlx+IRZ5SGS498dTBUGK4PWcUSrZQXlZZNxX6YWV1HWA38J
 KzNFyfLc92fZYMuyNotDnwnSn7BTNpcyC7xYiq8=
X-Google-Smtp-Source: APXvYqxUf04EhGPXWSNbYPcER3uGqrLxhKzfKNS71ZSDn70WiXvBJcYzWGdrRAVHK3bypwJ8YNcJ5vwZPpCaBfKz44w=
X-Received: by 2002:a92:ba06:: with SMTP id o6mr13787330ili.206.1583154292314; 
 Mon, 02 Mar 2020 05:04:52 -0800 (PST)
MIME-Version: 1.0
References: <20200226052603.22768-1-gtk_ruiwang@mediatek.com>
In-Reply-To: <20200226052603.22768-1-gtk_ruiwang@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 Mar 2020 08:04:37 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5EyWegKGeNhkEb9YQYJqA2bG-_T1LJcPEaaryV7RHOaA@mail.gmail.com>
Message-ID:
 <CA+5PVA5EyWegKGeNhkEb9YQYJqA2bG-_T1LJcPEaaryV7RHOaA@mail.gmail.com>
Subject: Re: pull request: linux-firmware: move MT8173 VPU FW to subfolder
To: gtk_ruiwang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_050454_048680_9101086E 
X-CRM114-Status: GOOD (  15.65  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Linux Firmware <linux-firmware@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, PoChun.Lin@mediatek.com,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+infradead-linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20200302130437.vOCOR2POsOD--X-YWJa5bV_OLwjGiB4B3Nfm5y2gM08@z>

On Wed, Feb 26, 2020 at 12:26 AM <gtk_ruiwang@mediatek.com> wrote:
>
> Hi linux-firmware maintainers,
>
> The following changes since commit efcfa03ae6100dfe523ebf612e03c3a90fc4c794:
>
>   linux-firmware: Update firmware file for Intel Bluetooth AX201 (2020-02-24 07:43:42 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/ruiwang-mtk/linux_fw_vpu.git
>
> for you to fetch changes up to a8a18d1ce5920bc0cfcf320747163cf13806b568:
>
>   mediatek: move MT8173 VPU FW to subfolder (2020-02-26 13:08:15 +0800)
>
> ----------------------------------------------------------------
> gtk_ruiwang (1):
>       mediatek: move MT8173 VPU FW to subfolder
>
>  WHENCE                    |   6 ++++--
>  mediatek/mt8173/vpu_d.bin | Bin 0 -> 2977184 bytes
>  mediatek/mt8173/vpu_p.bin | Bin 0 -> 131180 bytes
>  vpu_d.bin                 | Bin 2977184 -> 25 bytes
>  vpu_p.bin                 | Bin 131180 -> 25 bytes
>  5 files changed, 4 insertions(+), 2 deletions(-)
>  create mode 100644 mediatek/mt8173/vpu_d.bin
>  create mode 100644 mediatek/mt8173/vpu_p.bin
>  mode change 100644 => 120000 vpu_d.bin
>  mode change 100644 => 120000 vpu_p.bin

Pulled and pushed out.  I removed the local symlinks as the makefile
will create them on installation now.

josh

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
