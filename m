Return-Path: <SRS0=dr8J=ED=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7A0CD8C8C
	for <linux-firmware@archiver.kernel.org>; Sun,  7 Jun 2026 17:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 692091F00898; Sun,  7 Jun 2026 17:17:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780852668;
	b=TAhCV4poV4ZWHVtrWdmDv8De7pVsXwfIPFdAaoXkIC1HDBaUWejO8HkiVeNPoYgexKWH
	 d7tNaxw7etW6umoh239vC0eqMcsS4gOzpP54a1/U5z4DvYAbuAcRpj5KSmNA70MqYNBB4
	 os1ZepsozKaUgAt6RgOP2nfHCcln3KVDxbfpHM2J2IQ339OU64t5+OfBHxvmK9vHBFJgf
	 gSXWrWlvGu1dQdt3iBsKYUky10PIDVTxHBqNqIArb/YSzpEDkiHITn8Wtzme461zMWm3j
	 z7VxBDblo4aS1Ms2qr+Xg1vegQabX453QdVedps2RvSyMoxQm03ibpEOuMatBLOLvUw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780852668;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=84NSy2SOkwFjlqlEEMsQ3utrZfgOHrABYcmK+nsGLm4=;
	b=NriPtjkWNOKT31OU9O23fo4VwLZNlApX6KQMU2Zb0A9uF+S/nLxsmpL4o307+netdXcY
	 6eBQR/XVm1gGhGZvyNqBdtuJ4l7z/ikIxwYBlkBeUZiTOqbyDlIrMzEsKk1TYYKxXClLg
	 8eK2L32KbZen1tSdJQoHPbE8B/rFMS+i6erVwnloeCfOH072Xt6WvmcDYt9NO5Vzc35Ne
	 OAyVcWvzXeytfFW7IzMx1FX6L1aNv66eeffntCoCHEar8p6/mtMeU+q9lCmvnBEnm97+N
	 THCktEMf2HQ1fO4/BbZB5XlgYdxMCSTdarkjs4HsAVwuS5z1kHwpeHIt6wVM/Zb3W4w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fD1wK0Xk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZnJnAVkf;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFBBA1F00893
	for <linux-firmware@kernel.org>; Sun,  7 Jun 2026 17:17:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fD1wK0Xk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZnJnAVkf
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org AFBBA1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657El85u866306
	for <linux-firmware@kernel.org>; Sun, 7 Jun 2026 17:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=84NSy2SOkwFjlqlEEMsQ3u
	trZfgOHrABYcmK+nsGLm4=; b=fD1wK0XkMlhpvvloCcst8dj9lJ8cgP4U/AYr+X
	8oxx5lnPYaBaBQ5vNMZIEuHYu4viTf/fbyAM6lkTHmAAo7kzyZ+wupFi8gLOC/t/
	GJIHoUjPuFE8SyzbO4pkBkeLHlu+xRZa5nUIMGRc2ZvDlWxpYX7bhmPwrtHt70v4
	YVJM9RuKhOlMJ/cqcS8vsO3vBUeuuHXzQnZKFHBN9a6RXwzGa8XteUCBZm+fUEt7
	+Kk1gaiKT68WrClDzxC1WDEU1Z/1ti4qPOEdgtZztdWDquHLNG5C8RoyhAu8nxSh
	6Tis52lacQ6Yt648ElX9qnPjvuRD6uDHihCxCndw1Nq51u0A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w4et4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sun, 07 Jun 2026 17:17:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso46105435ad.3
        for <linux-firmware@kernel.org>; Sun, 07 Jun 2026 10:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780852665; x=1781457465; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84NSy2SOkwFjlqlEEMsQ3utrZfgOHrABYcmK+nsGLm4=;
        b=ZnJnAVkfble4z9F5cibxUhMW3WY6P9AT3VzXWS2O40dr5yTaN/CCrOk6On2WxWbbhP
         h9hRF1cGvYlxEPo4hr/nv8TOfOhcOUJ8avFk4d8DZGAoz7deUbEmfJi3muIo7vmIptgJ
         2rYOXT0e1Q48U56QEtAAfyG6NFjyrvJUUFTuECeH/MDpfByCcSH/If2ISrQkXoR6E+uU
         zfAFbE1UOTdAXB0OAQfdODdd0G690d3EkLZHYhrAUw5WcbDJ2U4zcIn8yC8S+NwEkC5h
         RK0xXIcbrC7V6X5EukpkbtGzDjxlCoDR4rgIkkFLfxVHd/VaQzXng3dZTnk+W4v0zfpy
         h79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780852665; x=1781457465;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84NSy2SOkwFjlqlEEMsQ3utrZfgOHrABYcmK+nsGLm4=;
        b=lVQSOL765wpHn8ef4YG1w7JL6w6Q8/5g7i4az0KnYNPWbeoMaFsLgfXai8cEKIZqF4
         VX0S1Sreukb2KBdoCw7Rgwug6A6McjLX5Kuxv/5kJodlTBCH+HGwMp6HhUPFHCF6Wjbp
         STuM0NFRjP4rJlI77qqwR7O3zZZJ8xka7BaNetf/v+BxdrUp7KjuqfcAng9I77C9kMUm
         L9twoPeGr+ck0p/vF4dwVzMSYOhhxUm3X+/kXopTkn/DbdBfWq4koBVnZ9s61yaluLOo
         8WHn2lqEC7guBF7UMAM96ctpW1aKkAtPbBMYpYExHUMZQ/XKv1MdNafVjckQsjaAiW3p
         K5vQ==
X-Gm-Message-State: AOJu0Yz6qryjKFpJwP0W60qNEeE/alJCN08Qfj8SiuBkvyM0BFfBiDXz
	eEag1jaVJ93Dw5m52RcoB8YgIU+Apdwpvw1ORdMR+oJSOnaU17S/qihWreQnNn4Vr4AVY0SqKDs
	8WwxSqKKYKc5Mip9ols1nFPHxjPiZg3FXSwTBdAyeUE7grY00r/e2PTjq/bX0SMfJRVnHHOI=
X-Gm-Gg: Acq92OHmEc2A2OuvuqUxNALDTb9oTOoYX5krnvPw5FbyzqckPhI05BtdgBCHQFWKBXh
	okvW4tFSeigjTziDrcUfQcf4lhdYwcLyiLS0V1xv23bA8bvf1C3e27LUoOKdSURkVxIOU1VHnQD
	ar6hvH1Jt4wkmRsgNY385cTppTLvvlnwdnYSNJIcBpF8dLBzpArh/mkU4sbxucL21oj6+Je319q
	9hqftPHh79rOgjkgPD/Bkx5HwIrsjjKOPsCO7tQRu8t4LwWbr/NMyT0VZT+A6ev0Sz41rqamLpD
	Oh0vkIIene8lkzzvpkvkyzwmUt8Qvqk0YjvDi2JE8spuiakLVGCkkNLxSt9Ng0z87zq93CEPJXT
	Gn9AW1d2yq8GNBqEZkKTSJmf9XJLXHhnTuNt5Ylkhy2XxwUNx+YcKQBVs1jsD
X-Received: by 2002:a17:903:41d1:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c1e85c0cbamr145096345ad.30.1780852665377;
        Sun, 07 Jun 2026 10:17:45 -0700 (PDT)
X-Received: by 2002:a17:903:41d1:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2c1e85c0cbamr145096075ad.30.1780852664867;
        Sun, 07 Jun 2026 10:17:44 -0700 (PDT)
Received: from [10.216.62.12] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c245dd3b5dsm30268355ad.81.2026.06.07.10.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 10:17:44 -0700 (PDT)
Message-ID: <8919e858-34ea-4085-9d5c-94c5c46a1bbd@oss.qualcomm.com>
Date: Sun, 7 Jun 2026 22:47:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for sa8775p platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: moeyi4M9yK1N2kAklYTmCNC-QjxZQ9bV
X-Proofpoint-GUID: moeyi4M9yK1N2kAklYTmCNC-QjxZQ9bV
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a25a7ba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=qC_FGOx9AAAA:8 a=qBBv3P8nucFailthiGIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE3MiBTYWx0ZWRfX243wiWfomje6
 VZaEdcQM45i9W/xjIrRIIMgxffFyWuGQL5EQ1HUgaXOybrB0O/QLuPiWP60SS4MffmT2/v+Mzco
 yfxUOOcMqXyp8dXPTbJBylNPnDmK9NqC54Ru0thGe2RSGdgdqBUuHHFTrqyKw7J/rhKoH1atyhw
 sH9FFsT0361PkOJy8akWyEC/pz2aMMYccuJDTiPZ61vvtCLHpDig/BRMJy8h2LGfzKd+K6ExzDq
 ubCxQ0u8sbZMy/xW4ZCODiVna66ldKgGpaEeLp/ekTlU+0dkOuKqi+Ovq24yvs1KRoB15mkE1QE
 U24JC43c3ycvhtzIApoa3UUFbWkJ8GxFMcwx1Z1NfeM5EMzpMhvJTvoW1DgX/nwYwJl9WWF4bSH
 k4Fv/QDzYcViLMGBeKqTSE4K1QGcEwWTImhLB/6i6XAhMPyVVS2M9fBYtF1p/aqTowWA+cjaqDD
 J8FLVf8rgomqcVetYEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070172

The following changes since commit d953ad875636676424a622ab91cab51b97a0f50c:

   Merge branch 'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-lemans

for you to fetch changes up to f29b7b531905b6da70f0a12e1f76f74f38fc6859:

   qcom: Update DSP firmware for sa8775p platform (2026-06-07 22:43:35 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for sa8775p platform

  WHENCE                  |  10 +++++-----
  qcom/sa8775p/adsp.mbn   | Bin 6799360 -> 6803456 bytes
  qcom/sa8775p/cdsp0.mbn  | Bin 3170304 -> 3174400 bytes
  qcom/sa8775p/cdsp1.mbn  | Bin 3170304 -> 3174400 bytes
  qcom/sa8775p/gpdsp0.mbn | Bin 5992448 -> 5996544 bytes
  qcom/sa8775p/gpdsp1.mbn | Bin 5959680 -> 5963776 bytes
  6 files changed, 5 insertions(+), 5 deletions(-)
