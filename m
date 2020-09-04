Return-Path: <SRS0=GKdd=CN=urpla.net=hpj@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4344C433E2
	for <linux-firmware@archiver.kernel.org>; Fri,  4 Sep 2020 16:59:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B97D22073B; Fri,  4 Sep 2020 16:59:54 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E595A206D4
	for <linux-firmware@kernel.org>; Fri,  4 Sep 2020 16:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E595A206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=urpla.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=hpj@urpla.net
Received: from 'smile.earth' ([95.88.238.127]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MaIvV-1k2Irl0hz3-00WFrI for <linux-firmware@kernel.org>; Fri, 04 Sep 2020
 18:59:52 +0200
X-Virus-Scanned: amavisd at 'smile.earth'
From: Hans-Peter Jansen <hpj@urpla.net>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Fix dangling symlink to
 brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
Date: Fri, 04 Sep 2020 18:59:50 +0200
Message-ID: <1719695.sWI7abA0Uv@xrated>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart3191470.KRah8qv3Oc"
Content-Transfer-Encoding: 7Bit
X-Provags-ID: V03:K1:Iht5A+yYPH0XCqwvdE7ujxQKQUzdreGvmjrW+sxVNQZiJtktj8z
 WpUcgmZlV2RYkwzvslQpJsWbkQ8BrrPEZK9mMyW+ra+QvnLWk13Y0u/WPhPA2w6Ww/QxnNY
 n8REKQq9ABNXi28ErGV/u7R0RJ9cGomLNi4QZQY7QMn2ESrujSGLA787ch3IH8d4fpp06OH
 JNSWG658g1jbtvJXg0gRg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hVVsqthVmgk=:/8dhqWeZAy0Y5X8qyXEhtR
 m/a7C9Pl4jikBCdwrgno8uxfaS9wdAOC6fkjzN1zv1kvC2mKkwiD8zLxYUKZX118f0pokKipL
 cooanQgaI7CqjaqvvOsIp/BRfpEI4hhqQq1Se9cQlRFd3JjDH8PXeNxd5VEoIGH2B3DFz8gcH
 P/hSG8YKx4XO5Bt7iPhCjbF/tgY2zI6ejy8cYT0ywNXuBNyOBaUB5OnkVFpYyGiL7DfMlKR3D
 3Im2sESe8ye1gjE75Rnuji7tOHHioweS19CegjuAqNXFEiWeiI8jXm4vCYJa771gHLWHbScH5
 oBWiNO6UKph42Hz5a3J6Gc45coNrBAHdczQsTUUJA/rYXJE+udnz/DNFupUPe/F4Om6fKb/xc
 fxudTUsMv8430N9ZRhamvznSZPg4FZAw6/Pxzj34UhiBaQf1QP3nohZFeO7UIRkqRKOj5+sWn
 xUoPDwd8oL9zhsqqugQSSWHfhMB7WSxBhQKcm4VNzKq9vnlv4d50mGaRHQ720GBbpitgg9rDM
 QOVCtUJMZrjMPEuRnXveb5eIGnz+P8RmG1DD4bDIHBAedyLNB6THInV5mjL1hzXYpGGwvfmEh
 bp5rq5CWlyrDQyOFBBs23CA+y0R4mq3NnEbGYaT3zUP3Gd7zpjttvNEwZsY5/80UYALJtOOnm
 /5GAdO0/n31tENbAf5QKjoesabyP3P0OcinYZAsxVmZcCOxFRvRxEL8RCjw3/7zNgalpMy/Gr
 5yB3FtjBC2l9tjErdkPFHLVnsxm5KOC2A+ltzQNr+m8MWxzFbJVlYEv70hqn4iGcX/UEAmFuy
 tFHpMO/54P0EFSYD79Fl7Gq7yEAEUi9/h2uNWATuhcY850OqKoxInFwJNAV7Oh7igr9HVNp

This is a multi-part message in MIME format.

--nextPart3191470.KRah8qv3Oc
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

attached is a trivial patch to fix a dangling symlink to
brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt.

Cheers,
Pete
--nextPart3191470.KRah8qv3Oc
Content-Disposition: attachment; filename="fix-brcmfmac-raspi3-symlink.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8";
 name="fix-brcmfmac-raspi3-symlink.patch"

Index: b/WHENCE
===================================================================
--- a/WHENCE
+++ b/WHENCE
@@ -2639,7 +2639,7 @@ File: "brcm/brcmfmac43430-sdio.Hampoo-D2
 File: "brcm/brcmfmac43430-sdio.MUR1DX.txt"
 File: "brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt"
 File: "brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt"
-Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
+Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a-plus.txt -> brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
 File: "brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt"
 File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
 File: "brcm/brcmfmac4356-pcie.gpd-win-pocket.txt"

--nextPart3191470.KRah8qv3Oc--



