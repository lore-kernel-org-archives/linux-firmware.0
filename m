Return-Path: <SRS0=1Mm7=VR=outlook.com=kweihmann@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1806C433F5
	for <linux-firmware@archiver.kernel.org>; Mon,  9 May 2022 10:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A49E9C385AF; Mon,  9 May 2022 10:25:32 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03olkn2055.outbound.protection.outlook.com [40.92.58.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6414BC385A8
	for <linux-firmware@kernel.org>; Mon,  9 May 2022 10:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6414BC385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oE+6z9iNKx8bYX5AgHDrT3RBfJ7Ba2r49U8LuWYKD9drqgvo28Y2q/+zOLLQNhRJh9aI6K0C8aBJCP7bePXa2sFO7j9ppbgx4gmh47XpBO8+K8qlF1/74dsop243LnotKVHFlhUCXwn9cgXRUlAWG1UGez+JDbqq3OsKbcGhBjGtACnnCPgVBmMBe+LM85qV1N+QTgXjpkY+1GRjN8u/Cvy/UuA9J7QgwLHi55hkt1XbSffyfO3xuELdS4iGFMaNHOdgifOTG3FO4Su8AObpEsj+pq+QHi7kqzSBGrAZnac3gu5XW1kuDnDvSZ5qIs/IZ/wUW5gByCHhOEVtmfuviw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZHL8T8Z5m/mT2biKHPVNTvpNp6w3Un1aGefvnJA2p4=;
 b=bySe4REKnZ/ch6Uu51rR+j9swajuW0MrKon1OcUKUoQ5Qqxh0LXA4Tx+hKnbqyUMDBA0RcFJjR92ibd8TGRpvqY5xuCSNypd/NucgwJUSwOCekeXoyEYexGaPCa1zrxxlQoSKiJ6lmfuE5Gg8gl+Nt8a7Z/X72Xil7zP7FOgs1SxvC49I46H0sMguSlnhT/aPDQHLLyVSTcZlexBBYMhqfX++bjkG3CmVL9tsUat1wpkrIcSyq7tbR2qX0OLS5D4Dc9/psVmjAv5qvekafde8FqQv1pWcB376Lg6MPTi7JYRP6tlmPGfM2U06e6cGxFDvXqcOJSKwpTbIsMbzEKHHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZHL8T8Z5m/mT2biKHPVNTvpNp6w3Un1aGefvnJA2p4=;
 b=sCSaqtVFhTrGuC3q21VxCfrwQSVY3t62yh1Sa0/z6jrqdE3v1wP8UmcVkpjvBEgf5iMtuexdEUdHL9bSQcb6RSfUP5EMOHCPQ9Y1Yof6512z0XYhmgY3Wp+gz4I898sYc8lVl21B0MR5T64jZriHDmhwxSEjZTr90tSnX3CZ/HfUafTzaSxB3/Yl3kMp0NsyKWb2PeqNGwaxA1Tl55LPfWt4GrmFWCHpqWrrtp3gZzk6aWjHAoxuBbVC+xuXpGeZQ2aFkBi0wQzOYDoFkRpHbP2hTC3lGSVLOgbRqzcECV7tvhSysa13nAo/gSsnFs2r5jIws9QYISGRUKmxko+qVw==
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com (2603:10a6:101:1b::18)
 by DB6PR0901MB1621.eurprd09.prod.outlook.com (2603:10a6:4:71::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Mon, 9 May
 2022 10:25:29 +0000
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::78f1:8a4c:7a86:b25d]) by PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::78f1:8a4c:7a86:b25d%3]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 10:25:29 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] Makefile: replace mkdir by install
Date: Mon,  9 May 2022 12:25:02 +0200
Message-ID:
 <PR2PR09MB310088EA719E6D7CA5C268F1A8C69@PR2PR09MB3100.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [F5qv5x3ZPRMg/I+VF78zjmeHZT2tiKYk2UOcirP2M0dO5uPYdCRgPSoWVz5UHzyC]
X-ClientProxiedBy: AM0PR06CA0117.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::22) To PR2PR09MB3100.eurprd09.prod.outlook.com
 (2603:10a6:101:1b::18)
X-Microsoft-Original-Message-ID:
 <20220509102502.3008717-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34618d86-3c0c-4bb7-5ab0-08da31a63cf0
X-MS-Exchange-SLBlob-MailProps:
	3UeWkQkuiJO87r2YoGLbiaI5gIpBD6rHFepiob5HQng12kSLYFzuw0sBMn2TgNxT7x/S1yJYuAZIqt9qSAgrPnSbQI7SEiGoEZwDzfyRUN4UXD7g/n6AsiCBc5xwTnfus5lvtFuMRFvS0mDiOumLLn3uWskUR6bowY6c+HFR3McEM/qyzUtjNidRzR2LZ1yMa/lNbDq8ItWqVbzXNv4c3LckmkP+Sa/U/wDGsVoD1PvCJRWTjG6yG0alQI4oh+vdOP4rEmwK5WgYSS+zU3qeNpHu4E13x+McRfVgtmD91P+Aj/+Wme/YdKlH4Z6FqFRxDYMOjFrN+eFhMWoSOBdXSnPEnt3wTi6uaZSkQ5Y3xy4/46iaG0PCQS6YiMIkr8PqV41jmjmUnEtytgvdCw/0MlxfpDG3BLHt7jKzt97LTWz8PC8icN4VbULYkkwVFjR51J8jfAMUf4hzJXTE2EEMGO9Vg5zpec8kCpOMdr82ZwR2pwP3jXnGnCPwuG9ESufHxQ3rO6oGmFXl+E5COH6UtMjG9f073r8MVzXH9LfPV7f5eL5pMoQqA64TIEIBJfeb/GA2BJ3XGt0dD4BKScbB3Q9SG1PYtg8EtgNVtNUPNUhY6jMl95NxiloMkf+mwthOxi4yb9SOLwMe6QIDrQ2CmxrEoxet9V4ioFauh78w1P60hqxIpgWGmIQpB0CdPYSrMovnHekKE8SwhD4o8DsHkRyfmfDFOUm0ylc//o43fQER882V2QsNMA==
X-MS-TrafficTypeDiagnostic: DB6PR0901MB1621:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hQUIXG8AFdBZo0L1ESMZDMkbpwPdDQiyoJE2bJd88E0pLuwzF6Z3dZRtYupcOYhfp/gf1PLiL+4rg3N2p2ly3QM5WptSQEveUsylsyC1w0xsDavKzWDyS3vsALsglQV9myhLXTIzjA96ZeZKYGWRHv2fC/hxRLHWRNioSv0W6jyY6ERmyprK51eSgQ5hNqS2+sLSJTzXQXki/MU+3VmDcxcRhqO9CKfH0bfYPe7zfv6h2R7YlbtlyqtLObCjFT6/bu+oolUxP0MyiiusG1FqUz5jhOqXDaQ0OHn75xj49hpL5lRaZ0gdITuKsqcJuRe49DaYCsPCulIIOkg/mMDTQQ326jdsyvlI3MOPNQBYe0a1W46rXRj1gFRIUPX6YaSAcKXU4mAkpmtawwqOnZknmwopCp9arDJSFZay4XYLfpWGdRNyoixwpWrpVkssRRooRZXwGxmzOh6qgI3UxNUnWYf+nsevAXcYAlDA/gnJxF0m8hm1WIBmQfB3LbAdWGTYaVtQBL+faBWqk2zey2aidxpvhF1ZaWoZuQODGGnDCBGFq9ZT5yCxc08QvFkiE783gxc/oAbTHMvSKgXqdrsoKahnViCqBsqJbgeRBSahjFpZcN9TGxPz9tIqxlSQR7zpfdT/uoWUKCOwtuWWA8IpnQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9vBqKph9a8IWaHNhYtyUY8ZWpg3mxAn1oObb4pbI90tAQpMmPYGtr2/4bp+c?=
 =?us-ascii?Q?VA5x2+OerK6hZqK+72IRBdU8wpwC8s57Kx2YZ2T5Mb5t7/0OgGYYJb4/0GT0?=
 =?us-ascii?Q?hrdmnkL5y5YD5YjEXjIQrSRpN6zckpuNr5v2OS+hAziSOaOyUZ+NW6JRc0Hb?=
 =?us-ascii?Q?SHGVHiXqt9U9j1LBj9v3639NkX3Z985fY5qdvmobsOU2gah73K59OAomoyLT?=
 =?us-ascii?Q?jW6TelnRQ/NAe8WR46lwCZdNWkTUtuIt9ERo3PqPALdRmdOtGtI82LgHk+Lk?=
 =?us-ascii?Q?5V0h9R5Sh5WOVNzurkgXPZPQHPIHE/tkVAwJMu84fLKo5J3pzixYSXx0QEbg?=
 =?us-ascii?Q?SgmykvxBuVsqmzN4v9SCBYPtXZ6hKMDPX5tjQB5hXGgmcwy/25+XjqAxGVon?=
 =?us-ascii?Q?TukLZuJsbzRlr6NmNaf00gVvj4lWRDBzJsvKkqbw+6aIjwG0j4kG+Fqopcdi?=
 =?us-ascii?Q?C1nKlacpb+MVBCUMrOvIYscj13EOqBhfjtkEKhdjPVoz9yKNNUCgccv3G68T?=
 =?us-ascii?Q?wbqa58ZaYPWJZcmIB9FDC0DuujMxPs4hfshoTn16MeWHEDeuDY2DE2yOHP/X?=
 =?us-ascii?Q?eB8Q5Oe8rWDj4gsc5b+C0hP848j0sflYTqn2XsrGAIsZbwsZ0QZswD/PAfS3?=
 =?us-ascii?Q?q8tx9EBYoG8kjoWfLJlzrWwMgW1kiGEzVN1/O5vC+c1kpsnnc5qV4jPo9K2E?=
 =?us-ascii?Q?lPhdlMITzL/xQKML9qMTgYafuRK5xI60JoOVW8n+p6gku5uLHfdf6CDeMuUa?=
 =?us-ascii?Q?calabEc/5KkpPZ18NEydue/KUeAxxHZ7oCsPIpvK8N2JSu8KHeLREaQUlNTC?=
 =?us-ascii?Q?I1JlyEO9DNwASwUo9LURlWUw+Z5kq7FPJnX8wz12+LECyRrmI/Ldg6xU9GHx?=
 =?us-ascii?Q?t8nOgd8hGrSs21191OBUDeDJ4wKrX1TztFq9aFFqCLb6kEy+PxlWc5Kvp+fj?=
 =?us-ascii?Q?oPCGmc27YykdpF09zodGYqhTi7AoNBBaRXY/vLGY0kDocrz+NhugW94ylX6I?=
 =?us-ascii?Q?czhjcndb+bhxPUvcPUW9pGvI2ztN10H1SJmdShGVo00jY4gZkJmE0fXoVVdQ?=
 =?us-ascii?Q?oqFpGpq6uzmB5bUbV0n6WaOfDC80f1q7ER/NX+AP0Uvf7XoU8UxWlvXht4tw?=
 =?us-ascii?Q?7rRLMmK2uej06aMDFE6+PXVPESrUxUlBbNJLXAghCaIrbNNBpmJVInsbKYNk?=
 =?us-ascii?Q?aGuzCeCgrJoZIDFfDwP3HC8AT7pS+CYTuSgRWcL12+qcP5wsZq/ElGv/I/lT?=
 =?us-ascii?Q?PJf67W8FSYi8KgRKOGCDSUJLKOZdjpkE2pckx3oCEzCOuhEoOTNVv4Y+OEMg?=
 =?us-ascii?Q?UF2vD4ltDaPmkDmCuwpvRr3ZkU3sTvDkRLesb8RpXH0R66SRCHmIwBkDjHPE?=
 =?us-ascii?Q?lWoak12MnsahdScoMFWcJEk/0hhKPFazYKDwQCE3aEBWNW5FPc9k1m95v8Tt?=
 =?us-ascii?Q?HcAQRK8PabpmILKREwbEuMxFYLMMczu7zTG6gUT4UyOdegJxiesCIvtJ9oad?=
 =?us-ascii?Q?87QQ8jvMjBT48gY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34618d86-3c0c-4bb7-5ab0-08da31a63cf0
X-MS-Exchange-CrossTenant-AuthSource: PR2PR09MB3100.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 10:25:29.1656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0901MB1621

mkdir -p creates paths that are bound to user's settings and therefore
can lead to different file mode bits of the base paths accross different
machines.
Use install instead, as this tool is not prone to such behavior.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 Makefile                      | 2 +-
 carl9170fw/toolchain/Makefile | 4 ++--
 copy-firmware.sh              | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index e1c362f..83a0ec6 100644
--- a/Makefile
+++ b/Makefile
@@ -9,5 +9,5 @@ check:
 	@./check_whence.py
 
 install:
-	mkdir -p $(DESTDIR)$(FIRMWAREDIR)
+	install -d $(DESTDIR)$(FIRMWAREDIR)
 	./copy-firmware.sh $(DESTDIR)$(FIRMWAREDIR)
diff --git a/carl9170fw/toolchain/Makefile b/carl9170fw/toolchain/Makefile
index 2b25ffe..aaea8e8 100644
--- a/carl9170fw/toolchain/Makefile
+++ b/carl9170fw/toolchain/Makefile
@@ -46,14 +46,14 @@ src/gcc-$(GCC_VER): src/$(GCC_TAR) src/newlib-$(NEWLIB_VER)
 	ln -s $(BASEDIR)/src/newlib-$(NEWLIB_VER)/libgloss $@
 
 binutils: src/binutils-$(BINUTILS_VER)
-	mkdir -p build/binutils
+	install -d build/binutils
 	cd build/binutils; \
 	$(BASEDIR)/$</configure --target=sh-elf --prefix=$(BASEDIR)/inst; \
 	$(MAKE) -j3; \
 	$(MAKE) install
 
 gcc: src/gcc-$(GCC_VER) binutils
-	mkdir -p build/gcc
+	install -d build/gcc
 	cd build/gcc; \
 	$(BASEDIR)/$</configure --target=sh-elf --prefix=$(BASEDIR)/inst -enable-languages=c --without-pkgversion --with-newlib; \
 	$(MAKE) -j3; \
diff --git a/copy-firmware.sh b/copy-firmware.sh
index 9b46b63..bbacb92 100755
--- a/copy-firmware.sh
+++ b/copy-firmware.sh
@@ -34,7 +34,7 @@ done
 grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; do
     test -f "$f" || continue
     $verbose "copying file $f"
-    mkdir -p $destdir/$(dirname "$f")
+    install -d $destdir/$(dirname "$f")
     cp -d "$f" $destdir/"$f"
 done
 
@@ -42,7 +42,7 @@ grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; d
     if test -L "$f"; then
         test -f "$destdir/$f" && continue
         $verbose "copying link $f"
-        mkdir -p $destdir/$(dirname "$f")
+        install -d $destdir/$(dirname "$f")
         cp -d "$f" $destdir/"$f"
 
         if test "x$d" != "x"; then
@@ -63,7 +63,7 @@ grep -E '^Link:' WHENCE | sed -e's/^Link: *//g' -e's/-> //g' | while read f d; d
         fi
     else
         $verbose "creating link $f -> $d"
-        mkdir -p $destdir/$(dirname "$f")
+        install -d $destdir/$(dirname "$f")
         ln -sf "$d" "$destdir/$f"
     fi
 done
-- 
2.25.1

