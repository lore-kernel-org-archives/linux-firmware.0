Return-Path: <SRS0=qZbP=G4=getscale.com.br=mario@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5361AC61DD3
	for <linux-firmware@archiver.kernel.org>; Fri,  4 Sep 2026 02:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 352251F000E9; Fri,  4 Sep 2026 02:09:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1788487760;
	b=2go8ObULBGHW3zYdVy3t8wtLT0Lb9oAxD1m+1WonMgYTqOaaKPThOedqoZ5am7isDInH
	 IHvMx0Yd6TnTHKSR6YYlqRHRcMi4x8W6k0eQOT4V23VQ2mt63js4E8bnR9G7U05bDjoVO
	 AXBD9Ie18niwvMoj3ESvRHGkWzuEvW0xi3EEvIz5PeoqwlZRJ+x6FsKCuPoZJnyXReVxV
	 Y6VHlyJ/3NPf1yeO8mLGFj3FSy3lTXYhiBk0f4HnrlMw9N8t8Wu1tum/MB//jQCCQCoFN
	 Qf6nj/vrGeMfxUdYACGpC+4qGkPSZw6O3wuKQsVUNIsTLmJTsC1b9mnlKWEHnWXW1WA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788487760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 From:Date:X-Gm-Features:Message-ID:Subject:List-Id:To:Cc:
	 Content-Type;
	bh=Dug14hvQsvzMeLs0uApV/U5oLHS6a0LrtuhVRzKP7is=;
	b=Rm7ifE0QsjeaqwHZAJVpQhWi0oOlw0cXr5z3n2ZAZdsJ2PRVQo9BR0Mcf66G06Sl1Sg6
	 4KbmWayt0hOHZLH1h9BrtQmNGsKnCjM1fgHSQQaT7a676Io5hLZCU+0QZpG7lpktGCIla
	 BwJwyyduykVoTOR8UMY3+HxhXf6clxXb9tZ0ehTKZvxtB1LiyInBfvazDvgDbXctXTMpN
	 MwMcjFDxgv2JL2sr9yxWjT7/rZr58lVPwkNapk1HhVAPXsT1CpsaDHGsGtYwRgG2zjkzp
	 l7MdofOvKGaCRxJ6z/sWvoSW7VoIu8d5Fo+JE8bYGNai0ibTcg/dIRNm/7hyloqNCbw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=getscale-com-br.20251104.gappssmtp.com header.i=@getscale-com-br.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="x4WT/PI4";
	dmarc=none header.from=getscale.com.br;
	spf=none smtp.mailfrom=getscale.com.br;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1BB9E1F00A3E
	for <linux-firmware@kernel.org>; Fri,  4 Sep 2026 02:09:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=getscale-com-br.20251104.gappssmtp.com header.i=@getscale-com-br.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=x4WT/PI4
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1BB9E1F00A3E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=getscale.com.br
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=getscale.com.br
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-865bdc6ed72so9405507b3.2
        for <linux-firmware@kernel.org>; Thu, 03 Sep 2026 19:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788487758; cv=none;
        d=google.com; s=arc-20260327;
        b=AJOq/3DZ9LnV2Qzwnrw9Nc1mk9oXbi6r3CacmdiSHLBaA38kY8LazCagLlJJ89ISsc
         OSgowboIYXI1hrF2fohOw/oc3iXJ9zdLtgwoa0FXaqNz/maxmyaAPE1SfqoL/iBKfzIP
         pO3g2vnHMhsxrTahVakVwRBsHAgnTMoWjRyDR54dt78IMq0B+HIv1fXo/OFyHQmwwcnY
         kXfsOuWG+ULPa5G+DFflZul1nt+/joXMYhavgnV8KwtbMR3Qhs6O3iowA0qUK5aogKtN
         8N+zFp6IjnMyxUjEL3+wNQmgKDqBc7yA2qHtBaNxqJ8pPX9K0ipUcJD7jM+FjeILHuQu
         5bdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Dug14hvQsvzMeLs0uApV/U5oLHS6a0LrtuhVRzKP7is=;
        fh=ZuJGCLgWhhZQBRvL4BMXaUkaKw+HFfqJjezqqFCKESo=;
        b=bd9BdvNg8nluI5Tkbtk61aOamNoBYHwZSWTDd2D/A/491j29e1Yz4agBx0kKWjyGA4
         0RH2YcgVa43mJvVxH6W2SN0cKzwTxjz7GAEWSWrmIEf6inhxXvAe4OCYv9GyrE6uZY5r
         4GWFdK023HkYVfgz3jONtefxYXKFzaANjvAwm2Qx5mTR3ZzP1cbMdSL0FRd5l01Zx7zw
         UKBuHHr+nIu1zCaBVqod8BoSI9ay2t9bKKNdJbX8BBcgzJIO11MbdK6oTTNdy5R7pMu0
         fpyXsdJYeIgyaTj+D1TzrrKo2Qhu/9okdTPEE7Vbat24jE1I2vuxmtFvnVWKDKxdHe2I
         7V0w==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=getscale-com-br.20251104.gappssmtp.com; s=20251104; t=1788487758; x=1789092558; darn=kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dug14hvQsvzMeLs0uApV/U5oLHS6a0LrtuhVRzKP7is=;
        b=x4WT/PI4vPtUMZIY045wdbWd98I7sAaHZe6p9xprBrkHT8RRSTeFQFDOqrpLcColks
         Fm7/V+mvKSWWdjRvyB8MjQlAoLWfAMji8deMTpoySTqkSPI5g5ZjhIDyeNuQxDX0f4k2
         RVfN8GA76dbmCLl1FH6awy2H2i1kfVAbMEJI95FDsDpp1lyQIeN4Zf4iQcX/qJX5m/8I
         FMDP6nZh6ZBPmNV3XPTMML70ql9mGBxJwbUsd3z+xwBV4Xr0HEI7F4zz9PrfRCf9kmn6
         RqjqRPQUtoFNUaS/dqx810wJbuJkeEZNBwOvTnQFHSLIr+GU+GVsKMLRJPy9eUqCDs7z
         TTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788487758; x=1789092558;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dug14hvQsvzMeLs0uApV/U5oLHS6a0LrtuhVRzKP7is=;
        b=Qy9magoS+aYdsqu85aD8maq2WODoPsQlL0un1yXU6DM4sOdgEAnMf4GGvbZd55GgZZ
         kpt43sfxqGfo8YJ5KzlfuVo8FRbGBV9Ufw5l+s+VBNIbX26DZvXG1o2orGRxkEm7t7iH
         n6cpUVr0E4d1/6vvwMsHXyyTmE6Yk6F7qzw4JJP5QJBr2gR1Oil1AxlSqlVNFBqv4Jeq
         SuarkxN9GjALQfZVXOkX6Pd/yX5r3xn9Be5VhUts0N0UoKdEwpGQnU99s7VHrDfR0e7L
         YCAgtBjv+uVK/czlAMENOssI7RK44cGXy5gNYsDa5nyA1YWIPG3EyvDQAZGeTVW1VNFi
         HT/A==
X-Gm-Message-State: AFuF++k8AEzMB/P9v9U1xqFEQtastWXnlGPeqM2iSEeMuBBlsuDFISAw
	j9eQy4EktF2Cl6sW3B6KP35/3of4ArmzA+iwhYezxsOHjvXv8Fe4RipnZ1trGsTjC94f3FzB9Jk
	EDf2ssQIkhP3yquNJSwwcWka8oDkfnT5da44uwsVSBMdii6WxJojP
X-Gm-Gg: AYBFou3iRhmTVQXdaTDDrKFZzuYyQNo14aJzD9pG8+LYw6bInjzcFglNVePfnjwlcQN
	gi11g2xIrEOo6GQDcF4vcddbdzAAUCPg8HNfljLrqi+9O0sU+Ib+2tKf1pq/Vrjun6qG5oAYeiJ
	Y2vaTHTPbMok1f5jgjwXXYxfX5aeckt23XBfjzGITDTKIJokn+3KdoaiY07BWfWItoGhUB3iDef
	cLq1pc5mmPk0KJgUdroSkjCPkfh+tPfhfn2bn7zybvOGy19svLITNTcTgy/GPL8Wabhj1SnSRwy
	71tJN6NWWmyKpmGtPTOkXjm6RPs6YNbwiuSLyRpMILVYsihtxRAmRMW6Iw6VeZ2H8CrYxEN4WTZ
	zyD0hv68MCR6W6rnuuqENra3e7Mjhp9xU+z/t2KuGWIKocQvfD8PzHitpSSPbPE7CFcnbBWe0GY
	k8XBV01kGDJmLZedN0dIZTO99nAo7WLbwT6tDEwhu+znV4GWKvzA+8+rgkePBn7ude7b1nFV4mz
	HHK8LI1m8KOJll0lrAUiNrlDzFfhgsD3i8RqKNgeannfg==
X-Received: by 2002:a05:690c:e3c1:b0:858:1661:a43e with SMTP id
 00721157ae682-8711b9aaa64mr18533427b3.0.1788487757996; Thu, 03 Sep 2026
 19:09:17 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 3 Sep 2026 22:09:16 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 3 Sep 2026 22:07:35 -0400
MIME-Version: 1.0
From: Mario Stanski Jr <mario@getscale.com.br>
Date: Thu, 3 Sep 2026 22:09:16 -0400
X-Gm-Features: AcwNN1XDaXtQz_DOP5De7wVOsTznIju6-tptNtJhslsZFFcD0SUEyHJNS-iMzqE
Message-ID: <CAJe=AAkCeK=-pVve0Ffw_k0UBp4_AiO5BwQ1d2yG-pVe8B0U4Q@mail.gmail.com>
Subject: [REGRESSION] mt7925e: firmware 20260813113118 causes severe low-RSSI
 5 GHz loss
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	regressions@lists.linux.dev, jb.tsai@mediatek.com, jwboyer@kernel.org, 
	nbd@nbd.name, lorenzo@kernel.org, ryder.lee@mediatek.com, 
	shayne.chen@mediatek.com, sean.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"

Hi,

I am reporting a severe low-RSSI 5 GHz regression in the MT7925 Wi-Fi
firmware added by linux-firmware commit 3c11e660d3a8 (MR !1191).

On an MT7925/RZ717 PCIe adapter [14c3:0717], WM build
20260813113118 remains associated at about -70 dBm, but traffic suffers
23-29% packet loss, 1.2-1.8 s average RTT to the gateway, and HTTPS
timeouts. Replacing only the two Wi-Fi blobs with the previous pair and
reloading the same in-tree mt7925e driver loads WM build 20260605184805.
On the same AP/BSSID, machine position, kernel, profile and RSSI, gateway
loss becomes 0% and average RTT becomes 4.237 ms.

Firmware-only A/B results:

                         20260813113118       20260605184805
Gateway packet loss      23-29%               0/20 (0%)
Gateway average RTT      1.2-1.8 s            4.237 ms
Internet packet loss     about 29%            0/10 (0%)
Internet average RTT     about 3.7 s          15.109 ms
Three 1 MB HTTPS probes  2 connect timeouts;  3/3 complete,
                         1 partial timeout    4.18-5.25 MB/s

The partial newer-firmware probe received 293689/1000000 bytes in 8 s
(36702 B/s). After pinning the previous blobs, a longer confirmation at
-70 to -72 dBm returned 50/50 gateway replies (4.236 ms average), 20/20
Internet replies (15.548 ms average), and three further complete 1 MB
downloads at 3.91-4.60 MB/s. A separate acceptance run at -74 dBm also
had 0% gateway loss.

Environment:

  Device:          MediaTek MT7925 / AMD RZ717 Wi-Fi 7 PCIe
  PCI ID:          14c3:0717
  ASIC / HW-SW:    79250000 / 0x8a108a10
  Driver:          in-tree mt7925e
  Kernel:          7.3.0-rc1, x86_64, PREEMPT_DYNAMIC
  Distribution:    Arch-derived (CachyOS)
  NetworkManager:  1.58.1
  wpa_supplicant:  2.12
  Link:            WPA2-PSK, 5805 MHz/channel 161, VHT40, non-MLO
  Regulatory:      BR
  Power saving:    off in both runs
  Module params:   defaults; no experimental ASPM/CLC parameters

Firmware identities and uncompressed SHA-256:

  Regressed WM/Patch: 20260813113118 / 20260813113015a
  WIFI_RAM_CODE_MT7925_1_1.bin:
    23ff53b4bb639b30481e2e06bb1688569ad1ba971b897936db539882abfbd120
  WIFI_MT7925_PATCH_MCU_1_1_hdr.bin:
    8eb46014d2a6b4124472eee7476d995008a6f40b1daffef87eb42f30d98699e1

  Good WM/Patch: 20260605184805 / 20260605184651a
  WIFI_RAM_CODE_MT7925_1_1.bin:
    7e4ed27d1e9fe21cdefda35a22da32137b2473fada350617fb603489af19346a
  WIFI_MT7925_PATCH_MCU_1_1_hdr.bin:
    089dd0252a7eb95feed55950ad0fd9e6f751a07b4cf22273de722b73fa50d49e

The regressed firmware stays associated and no driver timeout/reset/AER
accompanied the failure. RSSI was effectively unchanged across the A/B.
Bluetooth firmware was not reloaded during the test.

The workaround is to pin the two Wi-Fi blobs from linux-firmware commit
bd1c66cfef5fb9cba15f1838a3fd222fb88a832b, then reboot or safely reload
mt7925e. No kernel parameters are required on this system.

References:

  Regression commit / MR:
  https://gitlab.com/kernel-firmware/linux-firmware/-/commit/3c11e660d3a8f8b35e12809b4b721a722b597148
  https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1191

  Previous known-good commit:
  https://gitlab.com/kernel-firmware/linux-firmware/-/commit/bd1c66cfef5fb9cba15f1838a3fd222fb88a832b

  Original submission thread (Message-ID
  <20260818010915.445782-1-jb.tsai@mediatek.com>):
  https://lists.openwall.net/linux-kernel/2026/08/18/60

  Full sanitized report and reproduction commands:
  https://github.com/openwrt/mt76/issues/1128

  Related low-signal report:
  https://bugzilla.kernel.org/show_bug.cgi?id=219429

Could you please confirm whether 20260813113118 is known to regress
low-signal 5 GHz transport, and whether the blobs should be reverted
while a fixed build is prepared? I can provide the recovery-safe A/B
script, full sanitized output, mt76 debugfs state or traces, and can test
a replacement firmware with the same procedure.

Regards,
MJr
