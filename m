Return-Path: <SRS0=wPrL=DO=gmail.com=jony10biton@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064E3CD37AC
	for <linux-firmware@archiver.kernel.org>; Sun, 17 May 2026 12:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DBB73C2BCB8; Sun, 17 May 2026 12:43:51 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18B0AC2BCB0
	for <linux-firmware@kernel.org>; Sun, 17 May 2026 12:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18B0AC2BCB0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7dbd801138eso1654551a34.1
        for <linux-firmware@kernel.org>; Sun, 17 May 2026 05:43:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779021830; cv=none;
        d=google.com; s=arc-20240605;
        b=CcDfM6fYY3CrYoeDApA9w/rcputMLJgxyNTRBzUX4B72PnGd4B5eVLXPMc2tsAcNtx
         pvucfioWV8dXwftV/joHWRXz/F+LyiE17h2X8K8BYQLvUGeXlqu964JurxXMLfpI336p
         +Ro9nusIhgITUlBKfS691VkrdxwIxbPbX9Z5yZW0kD/U8VTEbP6h9GcroJEiELG8TPkc
         TpDDL7HLfanifhdy7ETe2122ck/SLN/hZBDvmYmjBrfAdkxGsk1sWwbHLO4752fLFdbi
         shOLU/em6TaGCaldCkfA9LseuRUQGUVfyDMoH04FcPLGxzmzET+p3GsPb/4VC+MB5Lum
         0tHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=phEQD9HInl3ko+ZkdtWjg6XS6RVjsOsUDKS7vJp5P98=;
        fh=thzlYDAT27MWbzz3if4rQyeooyybPz7D/zeQezHlJZA=;
        b=bx7gqX0aoAdquls4b9DDEAW3BEPw+8dcam5nvBEYFy6hZr8v9Tbk7PGO5bcvxgaHEV
         rWhYToHmUSSgbftzmFLomq2kXrlNGDk+YOwBpa9t1nSEVzd7nHndJBqLSBT0wVZdz05u
         AZ+zQJasKgO/mb/+/FAzJ327ldQbEWInbZuHrzSSBzVSkYF6mBcpMw8WPlBCC8cSe2V9
         V2PMoYW9Uyh2zllQunPHv1eQ9EFrnDktx5k9vShxsB6btfLRulm6+si1NMPPTBRIhQ3g
         8Mm/hlBTJc41bDxhB4T1iO1qj/ammyEIKsfp8KI8aekfvcRS2wrlSp8WOi0Ni1Peb6Ly
         8pWw==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779021830; x=1779626630; darn=kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=phEQD9HInl3ko+ZkdtWjg6XS6RVjsOsUDKS7vJp5P98=;
        b=S+g6cmIl+nNbveoN4Rhf1k/aNQhfLbeS1KAwPRJzgsafvE5hkxzBg6Z7+586hyDDAD
         4R+sE+zcH/FsRec5lRTOAqEHpiu2kNcJ6F4ByEzk6jM5O3FsBfDXnIS3jrHsqzm5XKN1
         GbaincFfcMlrXZIQiiGkRs3hWjBaTEuBYXB7QrHgY7WsQhoAfGGZU/5sW3zQt0Wzm+mn
         m1COCO8pyq8f76cSj2jFK8yGypKMOgER/QvuFBhjc67XhtFxnTO5YNh9RIXX7T8ypvtg
         zph81yT2dR1sZFYSMtdWLBHPklitCJ+dUG7leZ1RY+uGwtJisBAwUXDCigBR33xgZrWQ
         CDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779021830; x=1779626630;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phEQD9HInl3ko+ZkdtWjg6XS6RVjsOsUDKS7vJp5P98=;
        b=gFNyo/KDxf+tO55wV0ALvDU+f8DPO+mtgz4yX+zLqoYExMcO/MSAy7WeyeL31Y8xRG
         dEmsbfgodLlHOw6S/Fi2pUAXHkBrLIwpghC22d6+Gk54J+AXWgwup3ZXReNIgU9pLGWn
         mrfCA35ttBLxQgI0oxORMTrtdvhFOWgEKeqgwHA3clKOjdvq/hTQo9DSsWovDmjRpbfw
         hOb1Ai0nIjj61V8r52BN7rAUu8vbqnai7+TCdhaaEhz47J8wjrLeZiw6O20FgTjj6gM8
         yWbPYFoMlHT6xCj2ekcL04z9n4xPMxaAoTd1oXzg2x1sNmachjZETL63v7hqH+ewAEuH
         XCFQ==
X-Gm-Message-State: AOJu0YySoueJRxyty+hW3iOYN1N4EQs0QPbIGI3gROsBjgLqyH6Csccx
	i3WQ+xJm3C694zRBk1BZJwJFzPXPsLZSjfqQMxoCKpsoj8YT3pLISiPsoXa+8pDvcgPMMoUPLAA
	YISFqwNGvl8v7BAdT7UzhG0hn19xkfIOeIvqnRtM=
X-Gm-Gg: Acq92OE80e4X+BvbmQWbVKkZm02U8zeIu2UTYxAbg65in5G58uW+w3dFmDnBjufKLtl
	hT9S70qnDvpKnVpGMdltl0rXp1VNG3FFXZbmHYUu65z9bTgUPIDXkm190fzN/Om4DcE4PT6vCzj
	UrOoFD6vxFmQgwIOy83ct6jR5QCaqsstjZFz+48tM/l3KJbecCOzt1Zr+8SMHMrDifwiirbP1g+
	B7fKbzAmHcQhWUIA5VZsIVcvU2CJ6CYZW8wg0lU2dnxRcOVVMyvmiqphAU3tNErTRpPhhtzztJj
	ruOxrR8ICSBna9wBz7tO8Cv3Nn6XO2CbjVlEYknHh9WHJFrs7wL5WZCt5osj/m0dUN7I1FzdjA=
	=
X-Received: by 2002:a05:6820:16a6:b0:696:834d:cd2e with SMTP id
 006d021491bc7-69c5d411946mr6053655eaf.13.1779021829796; Sun, 17 May 2026
 05:43:49 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?15nXldeg15kg15HXmdeY15XXnw==?= <jony10biton@gmail.com>
Date: Sun, 17 May 2026 15:43:39 +0300
X-Gm-Features: AVHnY4Lu9T-_GjsTg9uZCazoMv1BbLHo3f9OnnfCaAdhrUdln118X1p-zVC1FNs
Message-ID: <CADsO33hgpoBksRwHvn+YAZMvR4X337pDHbSBJJF=Vm=y_m81gw@mail.gmail.com>
Subject: ish_lnlm.bin: No working firmware for ASUS VivoBook 16 Flip TP3607SH
 (Lunar Lake-M, ISH 8086:a845)
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Body:

  ## System

  - **Machine:** ASUS VivoBook 16 Flip TP3607SH
  - **BIOS:** TP3607SH.302 (2025-12-18)
  - **SoC:** Intel Lunar Lake-M
  - **ISH PCI:** 0000:00:12.0 =E2=80=94 8086:a845 rev 10, subsystem 1043:11=
54 (ASUSTeK)
  - **linux-firmware:** 20260410-1.fc44
  - **Kernel:** 7.0.8-200.fc44.x86_64

  ## DMI strings (used for firmware filename selection)

  | Field       | Value                                        | CRC32     =
 |
  |-------------|----------------------------------------------|-----------=
-|
  | Manufacturer | ASUSTeK COMPUTER INC.                       | ef534c00  =
 |
  | Family      | ASUS Vivobook 16 Flip                        | f25e936f  =
 |
  | Product     | ASUS Vivobook 16 Flip TP3607SH_TP3607SH      | 621ac0c8  =
 |
  | SKU         | (blank =E2=80=94 single space)                       | e9=
6ccf45   |

  ## Problem

  The ISH subsystem (motion sensors, accelerometer, gyroscope) is
non-functional.
  The kernel ISH loader finds `ish_lnlm.bin` but the ISH hardware
rejects it at the START command:

  intel_ish_ipc 0000:00:12.0: ISH loader: load firmware: intel/ish/ish_lnlm=
.bin
  intel_ish_ipc 0000:00:12.0: ISH loader: cmd 2 failed 10
  intel_ish_ipc 0000:00:12.0: ISH loader: cmd 2 failed 10
  intel_ish_ipc 0000:00:12.0: ISH loader: cmd 2 failed 10

  `cmd 2` =3D `LOADER_CMD_START`. Error 10 =3D ISH bootloader rejection
after three attempts.
  `XFER_QUERY` and `XFER_FRAGMENT` succeed =E2=80=94 the binary is received=
,
but START is refused.

  All sensors on this laptop are exclusively on the ISH's internal I2C
bus. There is no
  ACPI/IIO path from the host CPU. Without ISH firmware, sensors are
completely inaccessible.

  ## Firmware candidates tested

  | Binary | Size (uncompressed) | Result |
  |--------|---------------------|--------|
  | linux-firmware `ish_lnlm.bin` (20260410) | 997,888 bytes | `cmd 2
failed 10` |
  | ASUS Windows driver binary (ishS_SI 5.8.0.7725) | 1,014,272 bytes
| `cmd 2 failed 10` |
  | Dell Lunar Lake ISH binary (`ish_lnlm_39ceeaf8_58.7727.0.bin`) |
854,528 bytes | `cmd 2 failed 10` |

  The ISH silicon appears to be provisioned at the factory to only
accept OEM-signed firmware.

  ## Kernel firmware lookup order for this system

  The kernel (drivers/hid/intel-ish-hid/ishtp/loader.c) tries these
paths, most=E2=86=92least specific:

  intel/ish/ish_lnlm_ef534c00_f25e936f_621ac0c8_e96ccf45.bin
  intel/ish/ish_lnlm_ef534c00_f25e936f_621ac0c8.bin   =E2=86=90 recommended=
 target
  intel/ish/ish_lnlm_ef534c00_f25e936f.bin
  intel/ish/ish_lnlm_ef534c00_621ac0c8.bin
  intel/ish/ish_lnlm_ef534c00.bin
  intel/ish/ish_lnlm.bin                              =E2=86=90 current
fallback (rejected)

  None of the ASUS-specific names are present in linux-firmware.

  ## Request

  Please work with ASUS/Intel to obtain and submit the correct ISH
firmware binary for
  this hardware. The recommended filename is:

      intel/ish/ish_lnlm_ef534c00_f25e936f_621ac0c8.bin

  (vendor + family + product CRC32 format, per the kernel loader convention=
.)

  ## Reference hashes (for verification)

  - ASUS Windows driver binary (xz): SHA256
`e42281c70b07348ba8f9558d8f7800efb3b424f7e0ad146068ff3e4d68cb2130`
  - linux-firmware 20260410 `ish_lnlm.bin.xz`: SHA256
`d9163f42b77e78ec6dd1c26dc4c3b7824e6de6be1abbc6f1e5c8fadb79c1fb90`
thanks jony....
