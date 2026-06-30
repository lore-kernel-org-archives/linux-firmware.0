Return-Path: <SRS0=o4hI=E2=oss.qualcomm.com=srikanth.katakam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F41C43458
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Jun 2026 16:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2C8C1F00A3D; Tue, 30 Jun 2026 16:01:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1782835277;
	b=LkjdhY1GIV0us+uKoU/b6d0s7pmlCfnVscm4tEj83GvTdCbH0pxnOf5IzjMJhDiQkR1X
	 cmf1Y7OjiKzGEP6KrB9Ff8RJ/8vovoS9d/2mzrXhv9AAQG7l7lf/pgXSBDobxETd4Nj65
	 tIapikSauF7VjOf75lG9RBQGh085cvZzwiey92ZQd7fZtON1wqRZzYV5wxvDR2e12ePIW
	 iYMVNa/T+3UlhfIjAJnDjU2yvfrZbTxqdJB9T1nmfnYkYslPH+jHVePdpY4c68CSb4GUO
	 0M6KrAMDHLJvZ931sRn9Fy9pHZfo3Btgz3MN7NyzojeHwF5Bn5/bsZuyoqFtVVSRsuw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782835277;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:
	 Subject:List-Id:To:Cc:Content-Type:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xRbVDk4Wx9V28bN3FA00YYaJYuPZ6jArcIR8sDp4iH0=;
	b=jP/mWBa1wwL6ajXFBAvgfVUOl2o4NDjta3L/9mx73NVVnVNP+obD7IPhgrwzsy/DnjTB
	 3QiYHKGRHiakbfPErxQiiYwEhqgf5XibIs1oolE+o1t0z4XzXZNeMpVnnxe3w2bbXWPdF
	 oSxjnrGJ0I+gJgD+GgYnmMe7ekG97J7yxNlpxHzxV8i9PtdzbuS/pnYQ7YXiLHdMp2P0/
	 CTQm8GXRgv12H43m7H3AtxxGKS7oGaeuhNRKLft/2RLUyXzkkanpgqCYa3yzuDlgu+8p9
	 TXZTYCpMS0+2rJ7779BTeEJ1mVAbLDWIWF51uxqvieY8kzD1JSm4JYdfLM1OMASxmMg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GGFPIVZ/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O18Fg3tA;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 136421F00A3A
	for <linux-firmware@kernel.org>; Tue, 30 Jun 2026 16:01:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GGFPIVZ/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O18Fg3tA
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 136421F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDV6R2116465
	for <linux-firmware@kernel.org>; Tue, 30 Jun 2026 16:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=xRbVDk4Wx9V28bN3FA00YYaJYuPZ6jArcIR8sDp4iH0=; b=GG
	FPIVZ/edczxHO2ISR3GYVuQvzjJW0qAccoAfaNAL0T6CwDI4jq32gV1ao8TWdhj+
	ICXVnMjnoK6UFzCZkMVYzgbS57soBuFO0Xc4X2h2SWdPO2KjH5O4SA9wLR9LsgAL
	/3pRQyRO1AA+PB8L0HzRzfKmniYWlNfbFBCs4Y2NhtzJri6j85MVq/3yScCWXiST
	tKJYf1mbolByYCMxXgeeJrLv3bXLDLENhlNG67mHzosfXIERvForlb+Ubu46aeAh
	374KbKdkVeP/7gk61+O4y7cvVEjqm5K0hy7yjbawp/7gKtIC3C+Mo0SjFoD0xnBl
	cE1GQ3/EQ66vM2h12FfA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j4dtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 30 Jun 2026 16:01:16 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9fdc2870fso127881a34.2
        for <linux-firmware@kernel.org>; Tue, 30 Jun 2026 09:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782835275; cv=none;
        d=google.com; s=arc-20260327;
        b=nxG8q1gVw+Is+vRp2CtncfD2bMxqDvTlD1p8taNZhg2nx6bVscc3lKUWkQZzHWf9tv
         lmNjfmkrd+yLTqnaiy9K7xnfeKeG/rNCe8vexhhYCEHcmm5Yg/QR4OYufqFXNm7usOyC
         S7O4Sf2B77igJxiTB7BcL9OHhA1SdmFe7dVTWsMtfEaGEVNmX/xFyLpz+h57FLHwVBLb
         tJzfAlF/wWlYBlQk+1koLfWjCFlDmuIGI/CZLjufHWOzp/1TnLNKi+55vWblqNP1m0fQ
         4hBj+4K8dac3f7/J3PfUHnVm/3I9mVEjRkAzWR11waxQ2HPZOv6Xv4QYwBnb6863Z5Xr
         ilpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=xRbVDk4Wx9V28bN3FA00YYaJYuPZ6jArcIR8sDp4iH0=;
        fh=EKSydvufuvQV/GaJmjRewt1/Txqcw0J6koAhIbsa97I=;
        b=NPCtyA4rxQXwwid4J/bCvG1mpO2RBsQSswDcZWQjJjQ8t/mMFIXGzsfhD6qVQhTDHR
         Zm49w/tB9Y0nV5kpa7mTbn1oxTpBkVbVYDwHeX7FwM2wwdJbmrk9nTHMCNf3KcsYG7Jk
         uUh78Por7F2uImasIQxgkJ3mHpBE1R0kfTWJU1AGyAawqJAe1JEc0ThzRpgOzRvlguPh
         Gu4iTt3sTycOtK7hJjd3bwR2Ski2mqe61CZgFapq6YGJ2YZFUxWO+wAlX2PenSrJEMKV
         tXZGrI+Dylyf3Tp0+6ebkKAVyXVADGqXUTf24PMTLiV/c2+kjZTWsQjinNKpP/bMyc3O
         We/Q==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782835275; x=1783440075; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xRbVDk4Wx9V28bN3FA00YYaJYuPZ6jArcIR8sDp4iH0=;
        b=O18Fg3tA3wnQVqJ3CkXxWWVm+gcsL8dHPSVDSVR5+SW0fU0YJUQcngqECWUDFuEehg
         m8JcdkHU1FGymGRCa/E+vqRdILXZh7BRe0uY59pqTPLk7OnpTKfHcxoZtiYCh8QVKioq
         qqHpA6qjJ/rOiPKeqK5Wv3DksUMP1z/lz9mujfk0Wt75Htn0xWomgyheekl7dYIarNai
         V5RSz6U2PIZc/q8PoFzItN9LYju+6o10iMnO8jBcJUvX0ZY2PZdkzCZh6x0H1YbshMxb
         ilGs7S6I7iLA4IGMx4IL8rSb53PcZyuIJsi4VNuwCM7YCDVOm0+5Uonpxfo/mqs1/+/4
         GMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782835275; x=1783440075;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xRbVDk4Wx9V28bN3FA00YYaJYuPZ6jArcIR8sDp4iH0=;
        b=K4t+JgSoR++s39jAOfATgtLDoFau3drRuubBjS1j8ulkUcmJBVje3Qr/B1OqZ2oOUZ
         ff5bTRQ3yLPuDjjyI0RWz5Jq3UN+rWUW/QSyDH6Aaqjm+SX6XK9t1JR5SsRiJIUwbwDD
         KxGifp5OOUPwQcqH6YG5XCpnWgNcbQzDj/oyY+Mh49sskVlVsD8TNUBHiEfHR8Kg0bgZ
         ClfskjFhnHJun8uxhGDN2BiGHorDooHS75f6NV4VwTj/sRNcr2tdOBvmnIs1X/XutpFn
         eyt7lzrz2dSA46c9NIgJdVACxMu3UPFXKnH9Be4ulTSjAJEBT1Ek7EsunSsRUQM8DmMA
         +S6g==
X-Gm-Message-State: AOJu0YzL8R5a0Valash7DtuzBeUrm/ZL75zQp/HNnmfpm99MFMIUU+Dy
	AE2JMmnfTMVyE8v2T/Eh4GkjFDYywj9E6sYPO4k/S2ZnScpkEJgD2w+ybOmB1QwbM4VfF95Lstv
	SS9pdXXUEgcGiiEtNMXCIJ28U5i6LUPg4SQKPWopTNNNVY935dVld2vU1LE2P461UixqfeCPL86
	EqQ93jWgCWkIMQuJMst5l2V/UleqyJDjc24DPDegbIEmAtqG5zDozXMg==
X-Gm-Gg: AfdE7cnwe/rr6EC4fODB5c7bCc2RycSmeFmkew82H5xIcMAOfw5EV808JWTd2ujy+mu
	IABR7vLOebOfN/xSgg2hF9S+NYCpywdoQwqjKVSVikYW3vUXH5O8Uh3MnhY77Ad15CO22uuVj5j
	txDkW0G9d//3oTv9S8z59ta7Vq6Wc+p+aos8XEZWzCe1wZY/+GrGV8ePs=
X-Received: by 2002:a05:6830:6d52:b0:7d7:4fc7:21a with SMTP id 46e09a7af769-7e9fbfffcaemr669517a34.13.1782835275164;
        Tue, 30 Jun 2026 09:01:15 -0700 (PDT)
X-Received: by 2002:a05:6830:6d52:b0:7d7:4fc7:21a with SMTP id
 46e09a7af769-7e9fbfffcaemr669449a34.13.1782835274370; Tue, 30 Jun 2026
 09:01:14 -0700 (PDT)
MIME-Version: 1.0
From: Srikanth Katakam <srikanth.katakam@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 21:31:03 +0530
X-Gm-Features: AVVi8CcU1pHP0JjuDTqvLYRhWKU4Lio5_MyjSXSq-gg8L_eZUdmDJUfxcZMN9Sw
Message-ID: <CAPgfiAFB0TBsaHtmSJm3Xyj2-8u2Gr3sxCmb=tbvPG6vVAAYhA@mail.gmail.com>
Subject: qcom: Update qdsp6sw firmware for shikra platform
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dbaryshk@qti.qualcomm.com>,
        Raghukanth Joshi <raghukan@qti.qualcomm.com>,
        Raju Panga <rajup@qti.qualcomm.com>,
        Venkata Kota <vkasinat@qti.qualcomm.com>,
        Komal Bajaj <kbajaj@qti.qualcomm.com>,
        Viswanath Kraleti <vkraleti@qti.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: zpEacX_t-WjBNLyMLZwjIA6G1Q3jZZFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE1MSBTYWx0ZWRfX4uOu7mFPc1QU
 Xdf8+7F9BOkA/ZjPBkIP5SxEyF/oBJPVyILoEle/bNvVsVYWXRSqCNq9HCshLt5sxd7jAmwA1wo
 aejF2JYvlzJtr8oS93TANoEi3C52VTfEwNflvrat8uHvUB6O+AmHN2Nvo/2ZGJ7XnICasV2DJI7
 GnePR73OqjtFTVM6isRS+neDb5+hC5JZqf/QlCjTH/+BsPGQAq5KwXnjfYJPbBeg+G9zd2baMBN
 o/oc6UHzIH/ozJWVuYRt5dYmI0z9VQxkEx1VM5I26FMskkOphFg8FfB3LXGQXTQLBBm07rGlrxO
 ylIjjOnNFHRGmhLyTxIjg/3kUzYIOOBXjfTCbPDGMPQ2pAVTS0yzFTRfkHeXP0tVkujoFI97EEE
 PdLsLk5VVX0NhbUmNcKXhxJG6Pm95gVQqLxi2K14DYAnK/yvYQwLIJpqdNdmpjMsnYRyeSCv2xZ
 7Bz2yFVI1TjsY1np1Vw==
X-Proofpoint-GUID: zpEacX_t-WjBNLyMLZwjIA6G1Q3jZZFQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE1MSBTYWx0ZWRfX4TMMSTaqwDU9
 UfYlJ7EMBYmUz9P4gIiZ3przxe09HUs+u5u9Oe76ShnibelLU2XBBNCIxv2nUCX+iENxnKvEdaN
 eDU8pEcqkBPV4pDlMxrRyynBHmuHr9k=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a43e84c cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=qC_FGOx9AAAA:8 a=iEmrYEeJ67ZGnIs40l8A:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300151

The following changes since commit 1bd9b36771d9087ea76588812995587fc0024245:



  Merge branch 'robot/patch-0-1782476710' into 'main' (2026-06-26
15:53:01 +0000)



are available in the git repository at:



https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git  modem-fw-shikra6



for you to fetch changes up to 396aad69556b121575078264d3c59661ccc53744:



  qcom: Update qdsp6sw firmware for shikra platform (2026-06-26 22:26:52 +0530)



----------------------------------------------------------------

Srikanth Katakam (1):

      qcom: Update qdsp6sw firmware for shikra platform



WHENCE                      |   2 +-

qcom/shikra/cqs/qdsp6sw.mbn | Bin 5709176 -> 5709176 bytes

2 files changed, 1 insertion(+), 1 deletion(-)
