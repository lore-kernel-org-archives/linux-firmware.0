Return-Path: <SRS0=WfXu=G3=oss.qualcomm.com=xiuzhuo.shang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6EDC61DD3
	for <linux-firmware@archiver.kernel.org>; Thu,  3 Sep 2026 10:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F4A51F00A3A; Thu,  3 Sep 2026 10:37:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788431829;
	b=LubF6AK9pXIfmpU5jB2/EApW3kMcmCLUZOX6beyWrTqWtMvv2hRpdRfsI7tkDoSbikSx
	 50rGO1Jh7/V5RfULF4HgJOmlBa2v+kKoLPZwneMsJ2zabLDxWUQ/WxWY9ULfIARYSNdKZ
	 VtGJUhaZPFJ6Btq/+lnzp/CFRPu9c2q9NTg3AqMueWAc4/H7UOeMMuQrKMTV4rAUKkaPI
	 WtbrxflVu0/bcZXlcpJL/f3plZDQq/WaXP6zdY17ZsePF0FJIzHBQp+LpqqhyM7MAm+1A
	 wldGdSUXjnkmMmzY0LxOjjx3b5WFNwJRfdX2v7TMLTeVINxuGqi+fwbiPCNkfPxxlag==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788431829;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0eb1GyU5coj2Unt1Kc4HY6MkmP5132STXb+KWQDf/HI=;
	b=VyZpJEDy8mK4Zf22FOXS6LmE9+RMAjYxgq/pz97mYHD8XsGYRSGtqx6kvgZ0HwN7Ygb/
	 T6Ae3tLgWvGvLesF7jXGgI2oBAFoFa0CcKY9cdH7wZfBSeUATSqWkWDju3LLObmpfDpkU
	 HL35PFY9ENOWeXoM5eZdzLZKXPpIANLafT6wmd/DNpQm517sm8NvMMTu8uBqfTtPC5JtN
	 56L0vWEmRnGWiw69sJz4JobiP4ya6R46REpKz/OvN0hDEEHuO7/rJkqgp5CpnVxOoi2PL
	 WFx+WYFnlR4ttTr3CTJE6c4kNNPNy+D1UEBuUAjB8sNEuc5Rzxsecq6FG1bDIDdhE+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDRkDAlu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YM98uadS;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AC49D1F000E9
	for <linux-firmware@kernel.org>; Thu,  3 Sep 2026 10:37:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GDRkDAlu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YM98uadS
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org AC49D1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHR143852489
	for <linux-firmware@kernel.org>; Thu, 3 Sep 2026 10:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0eb1GyU5coj2Unt1Kc4HY6
	MkmP5132STXb+KWQDf/HI=; b=GDRkDAluFuJp+cGkmB3PFPuoRfXscBLeg8L3LZ
	QFb6roGOjWx6Wg8ItAV4a/z6UuY2PnclYVQLM5Zc+nPyICV1v1AL6AIfvmmFa8gG
	uR9KcDysZXic2NZFKEtMM3cucJ3uVRtPYDtc0X8+l11tbaSRyKj+yBycXMKt37nt
	Tf4e8AsRVUIOD7iUbyi4xwA67PpfoFwGYhBeEOJuQATPSRnXpjeJLXcCNTK15qkZ
	7G86fS6VHN/11+cQ65qNdLjVPlF0no1vBDVjwZI6285c5YHUFfC/J5s/r53/BLjR
	wE1NFoO+9CENI3CDqTOX9w1QuVc75wKEDWc6Zfk2DdcrHH0A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m0mv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 03 Sep 2026 10:37:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-851992f22ccso1707194b3a.2
        for <linux-firmware@kernel.org>; Thu, 03 Sep 2026 03:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788431827; x=1789036627; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0eb1GyU5coj2Unt1Kc4HY6MkmP5132STXb+KWQDf/HI=;
        b=YM98uadSCapWklRyGF1I4QyfZgSdzpyW0WOiHOyhhhi/MoJFCxPPY+W0V1+cc5aJEd
         HsVDIWtDime6z/+2qKteUvFFvnyhhRW6Ex/6XJLDNJRWGBc1iLIvSRmeNyWGJhMFBNpR
         Dg7zTheT/ErK6i9vPOIsl27kA7/c2hqWidWfK3kdj0qhe5y0l0DlvspTli6aqnOBJ8GG
         QnlUhTbLVZmLZBhJb5Yznm66qF2DtruOZoC19NhYfDHuNS6aVrBmePdBTVaC8GMM7N4V
         Q1cS8lWPz/B207TtZLfGlb9D2RF2LJS+g9pKdhkJ1gXY21njDB34y5zPHXB7Rkxnizrv
         y59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788431827; x=1789036627;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eb1GyU5coj2Unt1Kc4HY6MkmP5132STXb+KWQDf/HI=;
        b=gnm6E1S0sIvXB7J2FXmCGTVeYpDkTv/V99IGQNlUEMgpk12u4SpMs/Mnj/5DF5uTdp
         pWOfPI8l4mkBDN4gkdfymnmMmxH1yJYYGarwb/QwwgPDeMfUOiv1f816BaGZ0kz5yo5+
         QeLNGemg2dqb2MdIM/0Yw/XH2CF/8Nvazbpt/JPSwfNwEBdowN4I5CgmrsT1xbJh2W4V
         KetWJr83wNNCpXa62qVDKIi5w7e7I7ArqGvBqMiCm7y/8bB7ki+TEvvVbGXMDyTDp11w
         JaE6CuYJ1AczkdG1xzH+18luoak4kUuHspR7/uULKTNFCTBOxLFH5btKhdsyhbQC2+yK
         lQLA==
X-Gm-Message-State: AFuF++lWbRyGrMWVnlJ++6mYrhNs/wa3LdymyTgQZY6EwzqPMravlTSJ
	wqG9WSN5c/8NrsWOPEHnUZAuKmFr8bEsAHmECZ4U3xpcUHXbCKAH2NigkhQSs39E0tojTWYgR37
	mPiQ+1QSQaYkNJtUBCUTuPIZxAS/0IbkpVdzdhmtCyPTN0dHa2c0zNM3sq6XyOlG5lJAcKD8=
X-Gm-Gg: AYBFou0cT1W9qa5h4UtP1RMzjqQCCSeGeeVufAnPVtfonzXIb026KlstVNkxGYt4PhQ
	Bnn32v/mEE/5hedYO1rZvdxWeJO7zkBELHYSVRisTXjpR19BGg3uWhoD5rx9/mQt9xN4uzUtz/2
	gFw622x66GBjfX60mwsXPWqY9fDsC156usuBF8vidMW8vtfIZ+WruihPBgQLM2ID1IhNKO0PtIe
	By49CpQZNvtgApa9GXURz17eOo88mylFbII2+XtpYsJsRWpNOYiyYyFsEPJh85c50Q54Tdisyby
	8IzoIu3cm9/w6Vk30t39P0Q9ZHvVzDyAjRjV1jBlPYDkJGMOBkhE0Yd/GE+l9ILf0keg6GpJ3Vx
	+8nX3/aTT49wsuH95NX/Xo4g7PNT+
X-Received: by 2002:a05:6a00:2788:b0:845:dfef:75b8 with SMTP id d2e1a72fcca58-85ed3c7d3b0mr16503814b3a.15.1788431827320;
        Thu, 03 Sep 2026 03:37:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:2788:b0:845:dfef:75b8 with SMTP id d2e1a72fcca58-85ed3c7d3b0mr16503768b3a.15.1788431826916;
        Thu, 03 Sep 2026 03:37:06 -0700 (PDT)
Received: from [10.253.78.35] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2ae0308sm2613073b3a.21.2026.09.03.03.37.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:37:06 -0700 (PDT)
Message-ID: <cd7caef5-5d32-4751-a536-8a25ec3bd7f8@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 18:37:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
From: Xiuzhuo Shang <xiuzhuo.shang@oss.qualcomm.com>
Subject: QCA: Add Bluetooth firmware for WCN7750 on Maili platform
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ehdjvQJ2ScyjVVt9tjggFZXau0bA0gIW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5MiBTYWx0ZWRfX5xIw/Ab2V8u/
 GRyVGQO53/2FlFvYVGwH7HnWTGXw3YukNJaUI2ExzV7fYGbzeAGYCXS1byHcNW02/8Aq2K4Brl0
 g18CX3VbcS09O1z9ypOb/9GJ1D0DAQwBOR8zYdD1lrmAKpiffCEyDZ/7Z+6eoQK6tC448NBZPkX
 uZxiEvuCW0fLWMARy4Haq9wYTJz7a1x0XZpPthukHmv7BiFz5bXJGWu+WHSQraKSfUki3sV3x2g
 xymAGbcks2TqbwsRCrdOG1BixjkRGHUm83AL059ZSiyFkwn4MFW4Gp5rl5jS8Qdh9rvacwcHBov
 RWYzZvfIxUnvcjaZ+/exv+YgQ7Yvrzk9DVp/YXnyuX+dDIoBQYOl9/lEnK0sPJgmp1001eIudJT
 0NqNP617R4vvBecoNHXzLGlc4BYHghe1paa8fXgJcNhOt7aB/jEASGYLCIqxrbFWPCGpv90H89t
 4fkcOtzrjHKUbWWwRWA==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a994dd4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NEAV23lmAAAA:8 a=zaKaClIhwoY5PkX24FEA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5MiBTYWx0ZWRfXxtZ9RlQZvbiM
 HYjjW96Y3r+YpgFSU7tQ8UGMyBxCw3dknSPxrA21dr0VfPhsV86lKcXnUSfVRm0YTu3Igreiyfx
 DSpJ/pMvA3TNTit5ORrg8vb7YuOe0ME=
X-Proofpoint-ORIG-GUID: ehdjvQJ2ScyjVVt9tjggFZXau0bA0gIW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030092

Hi linux-firmware maintainers,
 
Here's a pull request for btfw. Please let me know if you have any problems.

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:

  Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)

are available in the Git repository at:

  https://github.com/xiuzhuo-shang/qca_btfw.git main

for you to fetch changes up to 1de88ae01e5bd9737fccefc8d24acdbeecd06d4c:

  QCA: Add Bluetooth firmware for WCN7750 on Maili platform (2026-09-03 18:28:54 +0800)

----------------------------------------------------------------
Xiuzhuo Shang (1):
      QCA: Add Bluetooth firmware for WCN7750 on Maili platform

 WHENCE              |  13 +++++++++++++
 qca/ornbcscal10.bin | Bin 0 -> 744 bytes
 qca/ornbtfw10.tlv   | Bin 0 -> 224945 bytes
 qca/ornnv10.bin     | Bin 0 -> 10837 bytes
 4 files changed, 13 insertions(+)
 create mode 100644 qca/ornbcscal10.bin
 create mode 100644 qca/ornbtfw10.tlv
 create mode 100644 qca/ornnv10.bin
