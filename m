Return-Path: <SRS0=LdFE=EZ=oss.qualcomm.com=wei.deng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3D9C43638
	for <linux-firmware@archiver.kernel.org>; Mon, 29 Jun 2026 08:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 93C141F00A3A; Mon, 29 Jun 2026 08:58:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782723517;
	b=iSfwnzjMjB53o/6jFZYVW3eDmlnynxmkdnCm08Ay662crkmIlCD8I5TstLFCE1oWePyn
	 tySMfSG4NpYRw/ZbKybEgmjW8VYk6biQXQl2wrdFEg+UjsdOhUrZN7C7RqpYXoJOPYgSB
	 KliTCcPmXlc9X6aGtPHnxTZ63VwlTqcwzU8PANdo64TTQzlfvZSaOyLkdPbsnyZlZZSY9
	 PHU8ZMMjd9epFdk509LnVZRCUVdUzPT4P85HyngHLE9Y1hYh3Yw2WhoAb7uy4oID2HGcM
	 WTk6OLSG/Ahzlz97Gi/TWFiqZrV+Dx5IYANmyrWGc9at4wbCW5n1r7bHXijB9jxg7qQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782723517;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:List-Id:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=d2+YTyoh7jgM0spBCR2n4PpsfJ4R3RAipOedCPHKu/U=;
	b=VZFzP706dS0eATV3cCOKRAfTa4Vl6rLwdRmXlAt5tv2DAutzB77L6xQ72sA02g9r2JFs
	 xRf5L0SjIsn73Bl2zjCaTgavCPuApHWgrKw0VjklT+qQsVH7wtI0Byvhy0JT43pQRmLi2
	 VTWms0eNEA/gYBjqUlJQU0Mjqnc/fnx5md5Z2hgZ431eqLXO6rM7ZgpQDGRiNVQ8bsGQV
	 eAPuox2E85e0AnjCtizAkAqrrkkXf4XZvDAlnwG/F4+IqDuUxQSK0/wOnvMW790vUJTeb
	 KyZg5H+VpuQIq6VALn/lVRFeVkUlHJVexEHENHGb7/cj+iFxawPHenN2sv9k7qa4JkA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AhHswaXS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I0dopO9L;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E6EEB1F000E9
	for <linux-firmware@kernel.org>; Mon, 29 Jun 2026 08:58:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AhHswaXS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I0dopO9L
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E6EEB1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6rNjS2151748
	for <linux-firmware@kernel.org>; Mon, 29 Jun 2026 08:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=d2+YTyoh7jgM0spBCR2n4PpsfJ4R3RAipOe
	dCPHKu/U=; b=AhHswaXSXQkxPxzfAnsbFw9DR4OjY8ZihtboWGNzDtA20KEFfIc
	m5a1+XIvaofZw5AZYHjHhITP0BR+vLV1AbeHhr5gO18H1rVjzJnSiLHMqe4f9eKw
	HeXIzSTWRploP1qBAWOyvzMemHyM6vYAMowCTXDcV6ATl7o2GNxN1rh1UzVF/4kt
	UOf1Fiy2P20UjAOZKe65XrqGIgETmCXZsRDnOwaKdElMKsD9ZDlX5mbR/Bc2bpsi
	JsxW9QE0QKlEqG1n3LeFb5misWon9A1bIbR0jfyjFFiaeCaatZn7LcvQ6RXJcMq+
	2Ll1Nm51XDbqRLZahVkc1eKWp2KsglPHSYQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tuwnh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 29 Jun 2026 08:58:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c982fbc4dso351799eec.1
        for <linux-firmware@kernel.org>; Mon, 29 Jun 2026 01:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723515; x=1783328315; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d2+YTyoh7jgM0spBCR2n4PpsfJ4R3RAipOedCPHKu/U=;
        b=I0dopO9L3LPClfNNnGY1N2S7PpcTx/uNketKU8fVSMfWy8FtVcBC6CUJRGLi46lPVT
         m4e4ZgO9tCSflqp0usr9oNKk6DBZyaNOiZjuoj9U/QhnbnYgObfQoQlu8no0Q7us93VF
         ebWDF/Olj7Sii5haZawAA0h5Fvsb6WEZ86fc1Db0ejz+ca3dos87QV7cquGOTaumdrQX
         I+PMonNqrmxW827FtlEySN9DUy9AuMoiQt7owrPIwE8a0jcx+vdrBm9YYht8sOUcj0Tu
         Uu5xrYIejsUvIU2eh5pMXDcFSq4HzOiAbK2poDXyXGIy89X3HJOjdbP4Gm7uhdyv3okm
         iHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723515; x=1783328315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d2+YTyoh7jgM0spBCR2n4PpsfJ4R3RAipOedCPHKu/U=;
        b=WbZ/jHmAQ6tQv2X74qEBhliCZwXBG3fDS7bzmTxp/k3igo9i4nHAOP4Ee8K7B1bLBR
         nCAKUZy7FiujQwDo8deV3gESs4fTxldR3/pufeoWbdPd/lbGEfxkiEF8izn5znjaux3v
         v2Uh7uPBow1XjywgGKyn6kepGUEFERfNtafM1Fbkv+bfG7LZi4gg1pVtX5c2CMxs23ty
         5zr+lv9sKMgEwZI7rUFVWnWEnfqV2GUqVYPbSIR2t13I5Res4pselw2agIsCjYtsANfL
         jwksSsbBXOxOggjSeN6tKo1hxb3CnDe6BYO7sDZeBzgp1QsueJZ24VTFC1xV35blSbsQ
         yNyQ==
X-Gm-Message-State: AOJu0YyeStpUqT4UzhyjEPvIRats1e45fdiYkczGXryJvm4O+kMbyri5
	/GM/KvB7VUDyzboNIrT42cuvXBE7A/HXQ/NN3kG9Q4GUkFafWInxbKo9xCpzjw6NkqLWVsIG5jx
	UzsTUSUudZFmynIkBnN8uh642Rvx8fBFJ8af7VPaeqgz//a8KTNRy6ddei/wnCFeRPP+wAng=
X-Gm-Gg: AfdE7cm2UKOl28kHoh6+6oLZo7CPM7G/kJOB9bRzyQmNtDvRQJWWq39lnc0NbZnoFCz
	M4eRIylr5UdlBoFZWBJ2f9yNcWWztHFv3dPls0w7BsC89tCgPWsrjbpd7NUc2IFoh6ewu2m0UUr
	b7nxQoRezB7XAQOjSuk4Jg70A43Meext+7HwSKy6hYrqNETWkyLaJvsJuuUDxYKWMRZyNMXW0ZW
	2nuz/lrwTEVc0iBMxjTEhJEMQGPqPGWgzFwSLV3/uE2FeDLcM1FGNLXpE0mq1C9ztgrCsk3nwnh
	/OXDarXhV2zWWiTfkYDaT2yQjVWQdfC8tYRcQ6U+s2JPL0lAbJOa2hiHCqzd1H94TA/jQ07LaAO
	OQQPvFzClP/XEaTvmlm5g4hkIRj23b+kLPgV2EgkCNLspxzlJueq2CKc96fNkXA==
X-Received: by 2002:a05:7300:e82c:b0:304:5074:83b1 with SMTP id 5a478bee46e88-30c84d1d771mr6406266eec.6.1782723514737;
        Mon, 29 Jun 2026 01:58:34 -0700 (PDT)
X-Received: by 2002:a05:7300:e82c:b0:304:5074:83b1 with SMTP id 5a478bee46e88-30c84d1d771mr6406254eec.6.1782723514087;
        Mon, 29 Jun 2026 01:58:34 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ed3af8c35sm4891904eec.29.2026.06.29.01.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:58:33 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cheng.jiang@oss.qualcomm.com
Subject: [GIT PULL] QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00072
Date: Mon, 29 Jun 2026 14:28:30 +0530
Message-Id: <20260629085830.3810576-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX2PilfJxP6rYp
 ay98v93CCh9dpUEOassCv1r4CUXm8uw5WtLf55+USqFVCiFMD6qh+hOhF8En8Eye0EF/W70KEs1
 Y+I6HDRLlOv1KWITul1hPBHh6k/rpKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfXwlX8me/GMVRM
 uVzMk6QI268SlLWJVBxSFsceWjgd+VVEgksfkeaevn94b2IireY5v6xclgPlmmK8qoAJlRj7APE
 T4aEt3uWxgL1CSO6ClKrtgpJDGucxEvfs/0idoblbhrZp2trsspz9VjlR2xTCWg2nwjZzK5M7Sz
 CdxmTndo7T7gYNhSsMpda+PMIYqy+4Q96NaQ/fPHYImAYlclvrTRE2i99FkuQ3pCDXEAA174ZsZ
 XvyUfaT4V075I+7R25EdojXMtIs+E1Q35zISfuSl7Yl53W0iZOZg75jfy54eu84kpW0uM6Skead
 OXeU7tXefiplfiAD1ZR5tCoieHaQMMqYg29DexhFz5lzhhcKFXnxBEcNK6ane7bwRyfPr947j8q
 l6NUsd7MmSH44uWst+ZbauoNiMcIjAp8mk2OVLF4xFurwAnCOPH0jiJkYslkbCieZlky5Iju0v1
 namR0vg7fbV68pAV/yQ==
X-Proofpoint-GUID: pZ9K58QX8I4rZSUVEBlsvIAWtNVphZqF
X-Proofpoint-ORIG-GUID: pZ9K58QX8I4rZSUVEBlsvIAWtNVphZqF
X-Authority-Analysis: v=2.4 cv=DY8nbPtW c=1 sm=1 tr=0 ts=6a4233bb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=FKD5faEgrb9DS0pHyn8A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit 7e909c703f293a9332c1b83be4eafa926d8c7bec:

  Merge branch 'amd-staging' into 'main' (2026-06-26 20:52:55 +0000)

are available in the Git repository at:

  https://github.com/WeiDeng-weiden/qca_btfw.git main

for you to fetch changes up to 1d172a788a72fdbcd4e832bd248d64ddd0748e23:

  QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00072 (2026-06-29 14:00:43 +0530)

----------------------------------------------------------------
Wei Deng (1):
      QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00072

 WHENCE                   |   2 +-
 qca/QCA6698/hpbtfw21.tlv | Bin 167212 -> 167212 bytes
 qca/QCA6698/hpnv21.b206  | Bin 6656 -> 6664 bytes
 qca/QCA6698/hpnv21.b207  | Bin 6744 -> 6752 bytes
 qca/QCA6698/hpnv21.bin   | Bin 6656 -> 6664 bytes
 5 files changed, 1 insertion(+), 1 deletion(-)
-- 
Best Regards,
Wei Deng
