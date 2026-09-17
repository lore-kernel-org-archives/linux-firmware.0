Return-Path: <SRS0=M2EX=HJ=gmail.com=alan.hovgaard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16184C982D7
	for <linux-firmware@archiver.kernel.org>; Thu, 17 Sep 2026 16:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E09E41F00899; Thu, 17 Sep 2026 16:29:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.171
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1789662542;
	b=24PFQ9Hb2WWRZ+KriPXvuFN6Z1MVrwKzWAKAw79vv9K3oT9e1TMtey7eHh8xjhwE2SQJ
	 2I3SE91tSptvWGfGxWbbPoL2GF2+8x72C/f8t8ySJRu6ORgAnKcVt/ZGaJrVmgVgZ6Z8M
	 MJhWiT+z6vf19+d32OH80WmHtCBWn4iZPfEJ9NT5HvnaZsR7SaJnFNuJheE6lH6gVnxsQ
	 hQ00OY/RmfuWy4qIp2tN4TFzyhV5iFmQ4ZuzTJfv+Am3e/r5bOMXtEWCfNxhAA06hzHzp
	 g7/VBj//NebNuQRex1hQLDmgyElvlNBm5uT/At61RXTMm5YF8Cbgrq5gPCx3SPaQ71w==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789662542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:From:
	 MIME-Version:Date:X-Gm-Features:Message-ID:Subject:List-Id:To:
	 Content-Type;
	bh=oedZKDoguVwNLbYxz2lRBjmCCu67v3k6W9evv7i7wzc=;
	b=zq/8zNJJZ9EKvnxs7xdkF0L88LweuefxNeodZ8hXkbf+aVfiWVyux6zADa4xsLdil+T0
	 tPvBUkXOxYKp+e/ejD8lQrnzVjteqUgV2uAIg6qOZ0uCLeP9H7waxDg/4uE7WF8oEOePj
	 72TJseOQfx5bZutCJPgGLWJjz9K6Xx+1Gwr4JDbT59A+x34XSf4iEdBMSZS04wX2YJHVl
	 QRH9wPmL2UIpc7B2DlpLOjWIVCkCmG2mm2JutlPMRMinSCWrGEtQn9qt7747VLd1ccClq
	 cJJ6IVkSunKexaMGTlmP4uMD/XKYxEoc/7g15jfG21IoOgRkF/K6+p2MEkP6gC5V2ow==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lFzlCCpK;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.171
Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 562A41F000FF
	for <linux-firmware@kernel.org>; Thu, 17 Sep 2026 16:29:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lFzlCCpK
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 562A41F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66fabb1a601so941397d50.3
        for <linux-firmware@kernel.org>; Thu, 17 Sep 2026 09:29:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789662541; cv=none;
        d=google.com; s=arc-20260327;
        b=AO1Yfw8ohJEQ4DSHpfY9DBFpaOh0dyMXIpF1wYvMvMYDI2Uyk4sfUIOylXPpZ2k9Ya
         0yBnrQUNExCVMTPthOP0yRzyKqQ6JLHYEjdfwO7wsLRSha73rcQXoJXbeiJd+DV8bjbu
         0ZtbRg3NjTN2J6Ugm5o6BiXXwfmYiFxDgMexJa5SOQLqIyawQf8AUIJQIXBNRLCWtYn9
         +DSBEuPMt9WswwtqLvByN0B/VbhpfpYUKBMimKbD93UpMrLRkVhdlI6jCGYsbYF5aDeq
         rv29QQyUIJVN5gDzNx84WiLdbayTL2oOiSfhXUi71GQ3r9GVF/SMgk62ZfNHyT8r3eKZ
         fAEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=oedZKDoguVwNLbYxz2lRBjmCCu67v3k6W9evv7i7wzc=;
        fh=HHZsxoEqlpmElyNpq8BuFadBVODt9hm5RjHkJ0C/AQw=;
        b=Z0Y2G761GxZ+CNM4+BumQURT67K0ifZJMce5meBx2nEL3XUOlI+LHvhTZlPxeCQsqk
         ZcxejkoNc53j/wnRD/39KSstufeJ5y6i0OJN2d3OlyPNAi1FkbHuyBEtdqbxIp63AjLa
         D4L7CZoEoETv14CE2Hf25t7dEyeNFNRVUo+my+rL0JzCt6rCYEJ87nLu+ogGKu3PEMNj
         ia8AroFiiCGM8qA/IKZvKhpoNyBFtCRExYmrvV40itjHO0JgWrvau6+jtLGPA8gxZM8M
         W8o02hZddt/MV+o08Q5Nsg2cwNVX/LN3B20pZjtnI970LZGsZb35defoEuCC0LEkXP6T
         Ogqw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789662541; x=1790267341; darn=kernel.org;
        h=content-type:to:subject:message-id:date:mime-version:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=oedZKDoguVwNLbYxz2lRBjmCCu67v3k6W9evv7i7wzc=;
        b=lFzlCCpKuzWoO8bQXtDq0a/5GPLH/cJx1CiUdkFgk2QGX8Zjrc0YuMtaEamR1cIQr8
         WbzL9R+9B+fvXEt+Idc53FSYSx7KgS4HF7XLyub9bG7WH9JTqakKuZJhHAU4quXzBPSc
         V14FhG+Xgk8EVn7AFapKN+Jcl27Lps/aiAk5gwoSAqECEC7Um53RilG+sZkWT/zUrRcg
         1W5Sha/nSLldGwg+EZxKJAddUGMfyd/NJs0Aggg7nkjJP1YYw1Vv5BpoQYrgIFWd/fno
         +7APMn7/lz2EHnW7GzDryHwRoBFALXkAIcAgFZJkWlwH90aSyCrSclNgEuX3BiVuAqmp
         Cjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789662541; x=1790267341;
        h=content-type:to:subject:message-id:date:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oedZKDoguVwNLbYxz2lRBjmCCu67v3k6W9evv7i7wzc=;
        b=LwjF3MWPUuf6f7ErpXI+l8hxT6Qt/O7+FTLy5gtdyBnpOxFgGdX1ei/yCDKVXy0eeR
         +tJ8sevCAIIud3o/QFcz36rnNe+2kR83DSpoUylfX8bRckLfoxAgevjM/tnXKYU6W7BK
         si9+bsoLJ6CGj9bMC8Rw7qPYwuARS8Xl+nWNIVmWnAnzyV2eAhTwmPXanU/7FVXDldBm
         2KqEenUXG8nKkPKjPseL/B6+PH/+6XinFsgiBpkQ2EwO8iQZu/Ae2pxcRBQc5Oha297E
         Zi9ZfC5wkzxN9JhS6x7R1rv09JHjHhP4/GvhKX1Uf3h9Unh+za+R4MRIqZ7oahwr8E2X
         R5VA==
X-Gm-Message-State: AFuF++n9TO29nj0xyI0aCdMOHA7yayYy34d0J7YqtxTrh5KCU7A12Rax
	8zeuiUNB0Obdhyn85Mn6cvQLBYdSbSd3422cmKCJ8FsMU/Hj2nILIpbKyAE9D7PcWPS5ijdACYj
	y8BTzszaTsayNXAnuQSnVDffHx1DSs7vgLg==
X-Gm-Gg: AYBFou3TUU/6YNXKr0gfgGxwPIeZkazk1jHIBKhBDMhRXaroeCDOqFd7pUlbHlXg21G
	rtGO6Fg/Lm9y++v4TV/SShH2K7Ss4SsEjIUvYRZQiDBUQwWWUWtAK6jLkIKWegvwcGuPFVf2y4G
	EFfuzTpdSkJM1T5n9VMjdRpUaBplkXf1a9yJ+4nUMEIowdX+WBoS4TTw73jtpnbmkAC4m8Vn3GM
	WYbyrh4LwEtyqUP9kAUkMSVOtw+33skuYSkaybQG6JaAzqYqCxGeCXjwNAHbYuJ/nWEgzR5QxZM
	93Tz99isgQnywcMD7puYjHAT1/yoGTIuLBQlgEXrcGe1ruSu+A28VrHBYeNwRKJwbpU+QK6TITr
	G+j++FBUlw0tjjkm69Q==
X-Received: by 2002:a05:690e:428b:20b0:671:5c2e:82a8 with SMTP id
 956f58d0204a3-671632732afmr1767388d50.52.1789662541223; Thu, 17 Sep 2026
 09:29:01 -0700 (PDT)
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 09:29:00 -0700
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 09:29:00 -0700
From: alan.hovgaard@gmail.com
MIME-Version: 1.0
Date: Thu, 17 Sep 2026 09:29:00 -0700
X-Gm-Features: AcwNN1V7jOBqK4FdRC1JlcHGnDHEP0gBHD6CVBE-iRa0WkhDx235spPNxiQwXKk
Message-ID: <CAJEbJRCH_YwTt68oPEmqz_-CGAgCJ5-dGocALr7k4zjyUUnY=Q@mail.gmail.com>
Subject: False-positive missing-firmware warnings for devices not present on
 the machine
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello linux-firmware maintainers and Linux kernel maintainers,

I am an Arch Linux user writing about a user-facing warning that
appears on every kernel upgrade. It is driven by MODULE_FIRMWARE
metadata on in-tree modules, then printed by the distro initramfs
generator (mkinitcpio) as:

    WARNING: Possibly missing firmware for module: 'ast'
    WARNING: Possibly missing firmware for module: 'xhci_pci_renesas'
    WARNING: Possibly missing firmware for module: 'qla2xxx'
    WARNING: Possibly missing firmware for module: 'qed'
    WARNING: Possibly missing firmware for module: 'aic94xx'
    WARNING: Possibly missing firmware for module: 'bfa'
    WARNING: Possibly missing firmware for module: 'wd719x'
    WARNING: Possibly missing firmware for module: 'qla1280'

None of that hardware is in this computer. I find it a strange
antipattern to report missing firmware for devices that are not
present. Treating that as a WARNING is, in my view, plain wrong and
misleading. Why on earth is the default to warn about hardware that
is not even in the machine?

Machine: Lenovo Legion Pro 5 16IRX8 (laptop)
GPU:     Intel Raptor Lake-S UHD + NVIDIA GeForce RTX 4070 Max-Q
USB:     Intel 700 Series xHCI
Storage: Samsung NVMe
Ethernet: Realtek RTL8111
Wi-Fi:   Intel CNVi

  Module              What it is                         On this PC
  ------------------  ---------------------------------
------------------------------------------
  ast                 ASPEED BMC/IPMI server graphics    No -- Intel
UHD + RTX 4070
  xhci_pci_renesas    Renesas USB 3.0 xHCI firmware      No -- USB is
Intel 700-series xHCI
  qla2xxx             QLogic Fibre Channel HBA           No
  qed                 QLogic FastLinQ enterprise NIC     No --
ethernet is Realtek RTL8111
  aic94xx             Adaptec SAS/SATA RAID              No
  bfa                 Brocade Fibre Channel HBA          No
  wd719x              Old Western Digital SCSI HBA       No
  qla1280             Old QLogic SCSI HBA                No

None of those modules are loaded. lspci shows no matching devices.

I understand MODULE_FIRMWARE lists every blob a driver might request
for any supported device variant, not "firmware required on this
host." Distros then treat that list as a checklist when they pack
generic storage/USB/GPU modules into an initramfs. The result is
false-positive WARNINGs on ordinary laptops for QLogic Fibre Channel,
Brocade FC, Adaptec RAID, old SCSI cards, ASPEED BMC, and Renesas USB.

A warning should mean something is actually wrong with this machine.
I am asking for this default to change.

On the kernel / firmware-metadata side, that could mean:

  - Distinguishing required vs optional firmware in MODULE_FIRMWARE /
    modinfo, so initramfs generators can stop false-positive warnings
  - Or documenting a stable way for userspace to know that a firmware
    blob is only needed if a given PCI ID is present

I am sending the same request to the Arch mkinitcpio maintainers,
who emit the warning today. I would like the user-visible default to
stop warning about devices that are not in the computer.

Thank you,
Alan Hovgaard
Arch Linux user
