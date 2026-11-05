Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BAA606A31B
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Nov 2026 11:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jyrFGPsE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UoEg0egN
Received: by smtp.kernel.org (Postfix)
	id 23A4A1F00A17; Thu,  5 Nov 2026 11:27:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793878031;
	b=k8a4nEJS9vlogesD0Jyb5FGICgkjHBEIVxg8sT3/B6RjODCrZD2Hto2F8c4RZV5Q++T0
	 PJKEHqlCWcvsu1m15SHPC0e19r4936PfCSkRAoEdBANvZz9l4nZf1AAKaZUe9GinHasrS
	 8JbCUaZs63Wyvq1vsMeqeVw+sEhwVGFGoRXa31IWs41ms2Jd4gxe+yHkx6yN7hb2Lmytk
	 zu4T4H7DV62vAronUPmaoIqP6L5nUYjV0VeCQnr2fxDmFbeMmYmX8dfFMkAZe/Q/PcTIl
	 AmlLLY/UDYRSAPqBtWhUK5MrqyhBfbML0acZGm/N4uYcsdEBGt6nLM9tzA4tCyeHqYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793878031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:List-Id:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yeBrT12JN9P6XXuHd5Cww+Xy0T1NcFt/yStpnATyx1U=;
	b=kGpho2iUrjuRJDeAJv8wnx1FGpRNwXEsGwiZdWYfd4QPFeeK8uXbWV+4nvwxmV5eVjHE
	 xr/a5kCdlkN6endJmxHBTKUpB6Oukvu5JUbHQqF8V4SI+p63rCk1ngusJ+PapwbIp74uB
	 7l/7pi3TsScZ8Io4+dqU2/JKMjNgfCHzEPmPiTjASDgTU+QO5TybixFyb7/B2j8aT/lyZ
	 rWzMTy0/y7NTJgSpT+QYNn1ZCM7djr+3lvznnUNgBrEYepMpXQ6tSluq0/Ug+XQo4RZ//
	 RaK4CvAhkz7sVPZyDAr5vKfM0Y98sE9JyKBSizqWKrlukxP+NDdv30QKbmeQZMcO3eQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jyrFGPsE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UoEg0egN;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BFE51F00A16
	for <linux-firmware@kernel.org>; Thu,  5 Nov 2026 11:27:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jyrFGPsE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UoEg0egN
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5BFE51F00A16
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tEr1444508
	for <linux-firmware@kernel.org>; Thu, 5 Nov 2026 11:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yeBrT12JN9P6XXuHd5Cww+Xy0T1NcFt/ySt
	pnATyx1U=; b=jyrFGPsEvO0scDDmRib0JRHeBDiGp1G5oHRUAXojT0Xim88u8PG
	QGasM21CyuBsQFjEnO8Qr2Cnin9TKWt4yHgPELWIdA69QryHatv/X/hY4Des8Njs
	NcjkZtLnc2Q23+7vtyR3xYOH4x7m0Z5iOelBwdYfS/BGkkcYcBTz6lWZGt+SDnNU
	nFCheVoYa+R3VePArAfQts5cG+EaglXb0cqKbVckXRWEs0m03i7VpsL9nF2S/h4o
	sKcHq63xpK0HEdzAZeFrxFAcruMQjcqk+ezN5hxhAmO5Pv50n7C0QxBxNQUJMU9i
	aPVBqdPq80c0ZHTUIKFwiMCYC/b/IAsh00g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaagq5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 05 Nov 2026 11:27:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f559420f3so193724885a.0
        for <linux-firmware@kernel.org>; Thu, 05 Nov 2026 03:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793878028; x=1794482828; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yeBrT12JN9P6XXuHd5Cww+Xy0T1NcFt/yStpnATyx1U=;
        b=UoEg0egNflFHP3JjDh5Ax9zbx1hKN6UChHdf4v7I7HZycmhaHM0bC2cpPPPbPvyXab
         1LiIwRiNfakCNx++8RLPjXzwILz1aMOkdp/0aBNIUlCzPZiJO1j0LNSY25EwMk9/fuH7
         SC4P34ByOma4rm1rhxc50vaA4ZiviD4U0Ul1yc/uK6qmasRjxsxxyUzHfz5d1LB89f+S
         OazV+3saacBajPVnSXoCEg4aMVbaKwrQVM1Ks+5a7iDOUJgNOiOHdsdrbT8Mys+eOwcW
         wl8bbZ9p+ZgvvxvMVhZJUM6XlvuPJdvP2u/pUXyVWcdZ1DfH5+oTXOY5NzDT9ZPt/tPD
         ujGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793878028; x=1794482828;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yeBrT12JN9P6XXuHd5Cww+Xy0T1NcFt/yStpnATyx1U=;
        b=yYDpUMLzX/wRFMixB4hG9E38SsO4pGMk8ndX0Ge13HAaJUSZRcwUp51oG5nhNJJTdu
         q7LXUk2UAHKZGHiBQSNVJHtCKHMl7WG5yCi/MCUEuOohFIpuqumCYgFFaP6VjF2UfNGx
         D+BwB4JDgNW/AgsjcVTZ4zJIhTyIri9HPlDArtJPuGM6gpFgrNdrYzucgPLvx8UgKOA4
         lZymksgXa4PnIJopMrcXsx6iMLoxv1peG+Ti9Hcm1O4nY/WH8GmVPR+N210C/dpUnxog
         NWUgtqOUxiOCobb0dWAh5Q7jsugnJU/nnAYjbcqm6Mm3uI1P7rMZEUNNgj29sIFhBebr
         LN5Q==
X-Gm-Message-State: APuU4Z+nf4R71GuDhd5hUWb1ZKi3sGpkFLJZMDogjVORGWLB3//2Uw8y
	JQEC6qrIh398da5/RS7DLqvaeRDj66I2bfV9fatxmzOwBCguJSiAYkQi6NdeS2gCxD7Vl7Bxajb
	acRILwYca3TaB8LsbVWeMg/C3zDtwVG0H+UFSGBUlZxHEMGkyTGOA1TPnI0Zn/pmCU2VsKg4=
X-Gm-Gg: AYBFou1dD3qVVXhdb2fHn0GNphFBJQB6k/hKet61Zu+VfJD5826ruLGZXr31/KD+MBX
	tw3G3UO9DygiT2VNhUgqNTqrZGgpGQ+b1T4cinxDdzaCzxwtsnjUTewXQDJ01JEMocl1CDBe5E4
	Aq8qcpSUuHNd0b6ZNB/82epnwu6mJ4Rg+rPTypeBEf2j6WMfIUmq5y1c1OmRtKQxEnlvkVhuk11
	jP5CB36zdZTgRNYCrn+wIyDcVSxfvTUVxTNJ9D6WxjJ09OxJSNiirSj2vbKFgorQSHxFeHye27B
	EaUWk5QzVkt0KDpD1ObdopZxz7EXtaEaQA6UY232ecgEJpeeqUUfOuM1r/8VV2HoTvi7fc1J1Py
	uc9musvLVLmd7kSbW38JS5Z/H5RhK3P1cgKg/NZV9q6RLFwON1ttIZ9jWPm7MadxIKsKmKGJHb+
	wLOY8MX19MYvLahA+z91PR
X-Received: by 2002:a05:620a:6cc4:b0:93f:34c9:9259 with SMTP id af79cd13be357-94421739a72mr3330950085a.50.1793878028385;
        Thu, 05 Nov 2026 03:27:08 -0800 (PST)
X-Received: by 2002:a05:620a:6cc4:b0:93f:34c9:9259 with SMTP id af79cd13be357-94421739a72mr3330945585a.50.1793878027739;
        Thu, 05 Nov 2026 03:27:07 -0800 (PST)
Received: from rohan.lan (37-136-110-54.rev.dnainternet.fi. [37.136.110.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38c28ebsm793719e87.54.2026.11.05.03.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:27:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [PULL] qca: dedup QCA USB firmware files
Date: Thu,  5 Nov 2026 12:26:59 +0100
Message-ID: <20261105112700.21315-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfXzR7g84Jn/7Wi
 2VL7rEKICiREGgoKR2zb8lUr9l6dEP4KJYA2T2TDz4h4q/S6ppoU0cMeBPLjaHGGLEcljyW4+FE
 +KtqHG4XpKrmLWDqHW0Sp4vQfxnre8SUXUjBl3ltAgmKcQqbREqEAcc8JYKAHVR7rqf3Ni6wC89
 cgTTC58OTppOUVAS6lFKEQPmWF006vPfrQ7Snbr46hcQ0sOcBpPtmP8nA6YbM+rT6l+5YGsGtUw
 NoZm1eGlyiggIs8Adut26PZ0uKRrt60zA90E4ZEIMCUrk6LOoFaqUwgBvYqgLPvh7KkBRBHzA92
 H6Q9znZvHp2bB7Qf258C3NaTGU9/vhrxr+p+q342L72I52MKROOcMCX0sk5jRMABgFOH/+dY685
 0JRJEKyQIkHjx8ErgMJGDiMBvKOCU3I+fnIYm67JIGjxpUgCIe4nOokOEXQu5p15E+xAcFD5kzT
 y/xtb67iBfdxM9eZuYA==
X-Proofpoint-GUID: tVAHkG0dqE_9gy7fMXRqISiIskh0E4Ni
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfX2F42HwMKD0R2
 sqCuJCn4y5XtfxAb3o6dYIE8sRJUaXiDORol5dP2w5siok09JZSXMLdwQqdDWE1xiBo2J2xMoHa
 2HBw37lvnuBQL5gGUER825bWaSvKNOo=
X-Proofpoint-ORIG-GUID: tVAHkG0dqE_9gy7fMXRqISiIskh0E4Ni
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aec680d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dRu2vDzo0ZMMkeVd4slQhw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=p0WdMEafAAAA:8
 a=7dRnIesAaeXO5TwU_4IA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050045
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit 703a4d95f86606b14b8433e7197663874ef89eed:

  Merge branch 'robot/pr-0-1793799659' into 'main' (2026-11-04 16:40:59 +0000)

are available in the Git repository at:

  https://gitlab.com/lumag/linux-firmware.git qcc2072-dedup

for you to fetch changes up to 1308e5fd64510223774218c0d1d681e7bfba40d0:

  qca: QCA61x4 USB: Link 00000201 firmware to the 00000200 files (2026-11-04 21:00:05 +0100)

----------------------------------------------------------------
Dmitry Baryshkov (3):
      qca: QCC2072: Replace duplicate firmware files with links
      qca: QCA61x4 USB: Replace duplicate NVM files with links
      qca: QCA61x4 USB: Link 00000201 firmware to the 00000200 files

 WHENCE                                    |  98 +++++++++++++++---------------
 qca/QCC2072/nvm_usb_00200101_0002.bin     | Bin 11006 -> 0 bytes
 qca/QCC2072/nvm_usb_00200101_0006.bin     | Bin 11006 -> 0 bytes
 qca/QCC2072/nvm_usb_00200101_0008.bin     | Bin 11006 -> 0 bytes
 qca/QCC2072/nvm_usb_00200101_000f.bin     | Bin 11006 -> 0 bytes
 qca/QCC2072/nvm_usb_00200101_0011.bin     | Bin 11006 -> 0 bytes
 qca/QCC2072/nvm_usb_00200101_0013.bin     | Bin 11006 -> 0 bytes
 qca/QCC2072/nvm_usb_00200101_001a.bin     | Bin 11006 -> 0 bytes
 qca/QCC2072/nvm_usb_00200101_001c.bin     | Bin 11006 -> 0 bytes
 qca/QCC2072/nvm_usb_00200101_001e.bin     | Bin 11006 -> 0 bytes
 qca/QCC2072/nvm_usb_00200101_001f.bin     | Bin 11006 -> 0 bytes
 qca/QCC2072/nvm_usb_00200101_0201.bin     | Bin 11006 -> 0 bytes
 qca/QCC2072/nvm_usb_00200101_0601.bin     | Bin 11006 -> 0 bytes
 qca/QCC2072/nvm_usb_00200101_0604.bin     | Bin 11006 -> 0 bytes
 qca/QCC2072/nvm_usb_00200101_0605.bin     | Bin 11006 -> 0 bytes
 qca/QCC2072/nvm_usb_00200101_0606.bin     | Bin 10990 -> 0 bytes
 qca/QCC2072/perinvm_usb_00220100_0002.bin | Bin 498 -> 0 bytes
 qca/QCC2072/perinvm_usb_00220100_0006.bin | Bin 498 -> 0 bytes
 qca/QCC2072/perinvm_usb_00220100_0008.bin | Bin 498 -> 0 bytes
 qca/QCC2072/perinvm_usb_00220100_000f.bin | Bin 498 -> 0 bytes
 qca/QCC2072/perinvm_usb_00220100_0011.bin | Bin 498 -> 0 bytes
 qca/QCC2072/perinvm_usb_00220100_0013.bin | Bin 498 -> 0 bytes
 qca/QCC2072/perinvm_usb_00220100_001e.bin | Bin 498 -> 0 bytes
 qca/QCC2072/perinvm_usb_00220100_001f.bin | Bin 498 -> 0 bytes
 qca/QCC2072/perinvm_usb_00220100_0021.bin | Bin 498 -> 0 bytes
 qca/QCC2072/perinvm_usb_00220100_0022.bin | Bin 498 -> 0 bytes
 qca/QCC2072/perinvm_usb_00220100_0201.bin | Bin 498 -> 0 bytes
 qca/QCC2072/perinvm_usb_00220100_0601.bin | Bin 498 -> 0 bytes
 qca/QCC2072/perinvm_usb_00220100_0604.bin | Bin 498 -> 0 bytes
 qca/QCC2072/perinvm_usb_00220100_0605.bin | Bin 498 -> 0 bytes
 qca/QCC2072/perinvm_usb_00220100_0606.bin | Bin 498 -> 0 bytes
 qca/nvm_usb_00000201.bin                  | Bin 1859 -> 0 bytes
 qca/nvm_usb_00130200_0105.bin             | Bin 6316 -> 0 bytes
 qca/nvm_usb_00130200_0106.bin             | Bin 6332 -> 0 bytes
 qca/nvm_usb_00130200_0109.bin             | Bin 6332 -> 0 bytes
 qca/nvm_usb_00130200_0110.bin             | Bin 6316 -> 0 bytes
 qca/nvm_usb_00130201_010a.bin             | Bin 6683 -> 0 bytes
 qca/nvm_usb_00130201_010b.bin             | Bin 6683 -> 0 bytes
 qca/nvm_usb_00130201_0303.bin             | Bin 6683 -> 0 bytes
 qca/nvm_usb_00130201_gf_010a.bin          | Bin 6523 -> 0 bytes
 qca/nvm_usb_00130201_gf_010b.bin          | Bin 6523 -> 0 bytes
 qca/nvm_usb_00130201_gf_0303.bin          | Bin 6523 -> 0 bytes
 qca/nvm_usb_00190200_0106.bin             | Bin 9470 -> 0 bytes
 qca/nvm_usb_00190200_0109.bin             | Bin 9470 -> 0 bytes
 qca/nvm_usb_00190200_010a.bin             | Bin 9470 -> 0 bytes
 qca/nvm_usb_00190200_010c.bin             | Bin 9470 -> 0 bytes
 qca/nvm_usb_00190200_010e.bin             | Bin 9470 -> 0 bytes
 qca/nvm_usb_00190200_0110.bin             | Bin 9470 -> 0 bytes
 qca/nvm_usb_00190200_0112.bin             | Bin 9470 -> 0 bytes
 qca/rampatch_usb_00000201.bin             | Bin 54432 -> 0 bytes
 50 files changed, 49 insertions(+), 49 deletions(-)
 delete mode 100644 qca/QCC2072/nvm_usb_00200101_0002.bin
 delete mode 100644 qca/QCC2072/nvm_usb_00200101_0006.bin
 delete mode 100644 qca/QCC2072/nvm_usb_00200101_0008.bin
 delete mode 100644 qca/QCC2072/nvm_usb_00200101_000f.bin
 delete mode 100644 qca/QCC2072/nvm_usb_00200101_0011.bin
 delete mode 100644 qca/QCC2072/nvm_usb_00200101_0013.bin
 delete mode 100644 qca/QCC2072/nvm_usb_00200101_001a.bin
 delete mode 100644 qca/QCC2072/nvm_usb_00200101_001c.bin
 delete mode 100644 qca/QCC2072/nvm_usb_00200101_001e.bin
 delete mode 100644 qca/QCC2072/nvm_usb_00200101_001f.bin
 delete mode 100644 qca/QCC2072/nvm_usb_00200101_0201.bin
 delete mode 100644 qca/QCC2072/nvm_usb_00200101_0601.bin
 delete mode 100644 qca/QCC2072/nvm_usb_00200101_0604.bin
 delete mode 100644 qca/QCC2072/nvm_usb_00200101_0605.bin
 delete mode 100644 qca/QCC2072/nvm_usb_00200101_0606.bin
 delete mode 100644 qca/QCC2072/perinvm_usb_00220100_0002.bin
 delete mode 100644 qca/QCC2072/perinvm_usb_00220100_0006.bin
 delete mode 100644 qca/QCC2072/perinvm_usb_00220100_0008.bin
 delete mode 100644 qca/QCC2072/perinvm_usb_00220100_000f.bin
 delete mode 100644 qca/QCC2072/perinvm_usb_00220100_0011.bin
 delete mode 100644 qca/QCC2072/perinvm_usb_00220100_0013.bin
 delete mode 100644 qca/QCC2072/perinvm_usb_00220100_001e.bin
 delete mode 100644 qca/QCC2072/perinvm_usb_00220100_001f.bin
 delete mode 100644 qca/QCC2072/perinvm_usb_00220100_0021.bin
 delete mode 100644 qca/QCC2072/perinvm_usb_00220100_0022.bin
 delete mode 100644 qca/QCC2072/perinvm_usb_00220100_0201.bin
 delete mode 100644 qca/QCC2072/perinvm_usb_00220100_0601.bin
 delete mode 100644 qca/QCC2072/perinvm_usb_00220100_0604.bin
 delete mode 100644 qca/QCC2072/perinvm_usb_00220100_0605.bin
 delete mode 100644 qca/QCC2072/perinvm_usb_00220100_0606.bin
 delete mode 100644 qca/nvm_usb_00000201.bin
 delete mode 100644 qca/nvm_usb_00130200_0105.bin
 delete mode 100644 qca/nvm_usb_00130200_0106.bin
 delete mode 100644 qca/nvm_usb_00130200_0109.bin
 delete mode 100644 qca/nvm_usb_00130200_0110.bin
 delete mode 100644 qca/nvm_usb_00130201_010a.bin
 delete mode 100644 qca/nvm_usb_00130201_010b.bin
 delete mode 100644 qca/nvm_usb_00130201_0303.bin
 delete mode 100644 qca/nvm_usb_00130201_gf_010a.bin
 delete mode 100644 qca/nvm_usb_00130201_gf_010b.bin
 delete mode 100644 qca/nvm_usb_00130201_gf_0303.bin
 delete mode 100644 qca/nvm_usb_00190200_0106.bin
 delete mode 100644 qca/nvm_usb_00190200_0109.bin
 delete mode 100644 qca/nvm_usb_00190200_010a.bin
 delete mode 100644 qca/nvm_usb_00190200_010c.bin
 delete mode 100644 qca/nvm_usb_00190200_010e.bin
 delete mode 100644 qca/nvm_usb_00190200_0110.bin
 delete mode 100644 qca/nvm_usb_00190200_0112.bin
 delete mode 100644 qca/rampatch_usb_00000201.bin
