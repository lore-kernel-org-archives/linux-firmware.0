Return-Path: <SRS0=0dEZ=EB=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E696CD6E5D
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Jun 2026 06:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69B4E1F00899; Fri,  5 Jun 2026 06:47:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780642048;
	b=2wi5WV8qxx+MgkSd8SXQDOKZGVMgLekjgUtw7zQYVRuHKhpyBD/AkN3oMjBf4F+rxUj7
	 R+vMEuoeuHDtDJ5wK7ZBUA2AXXqpcdQI740yqwkSN75tov+6iQeLeAHp6nGgWL7eu4ID5
	 yEiz/DRpPmndi3PgowjPPssWhzG1/YI+JgVIrablQg8D84Gtaf4QQYOg9GvqoyiDi74fy
	 Apnv2lgN/V+emLO2cxsB4BFs1erMWrbM782dTwPNKwZlJfkacUVmL1QetHC2962qoa6wU
	 z9I+pwTTaZoefUk25rNhO/bYBsOZH6VTAdrS21WJEn7qgdd8rzTOkvTBMwVk/cae+aQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780642048;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7LPe/LYlKzoiVBJ/h57gPJ9p3ldaFGvAooEjplbZo9Q=;
	b=3U04Er+XYB5tBm7mJDGhYgs5GDeamdGhFlEfuQa3BeuIz7wBuXKW1Rbk04I76TZfn3P6
	 p/u/HGZN0E+hEXFAJ+6BaC/XyBv65YWLtD1icrtzUd/BhE0Ke4RiAJk+n0aiFhsoIYRre
	 uSVgY2tX3MhzcB783c4FluxdbbUD7z5P2dLnMB5DFny2/EXmdkTe3IA/gUZG9gBOHX9Ab
	 XqByqfPG6Zwaj+YyjKG0+/uaOzmosLYnlBEienXwLq6InYBpjg0Oorrf26dDYNSKOsv/p
	 7qAMBSDW/U905kU+m2IlRMawRqPd7Sm/rHuhMvGDBKlakd3Zm3A19InUwsBddLk05Fw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VcOMnrsB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fiw1O4Lv;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C15601F00893
	for <linux-firmware@kernel.org>; Fri,  5 Jun 2026 06:47:27 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VcOMnrsB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fiw1O4Lv
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C15601F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65525cAG820652
	for <linux-firmware@kernel.org>; Fri, 5 Jun 2026 06:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7LPe/LYlKzoiVBJ/h57gPJ
	9p3ldaFGvAooEjplbZo9Q=; b=VcOMnrsBxgD0zu85O3KeK62REuwTk8OA7RdlNv
	oQipfLLv4m0x5ma1wACoQvQIbRanTQZDxyuA8pzV5H7ScyRLgpZ8tHuXZJbCv3pJ
	jEbEEM7zlMU1YywoY6SB4h+ikyT9vmGCc498whOFVXmGDiN31CEANCmfVZzQXqQS
	yuebscsgnvIeSBBOV0QP4s2XIIbj/87oBS4Lg4IZJ9RcXAj+vU0bmMNypmSHuJ7N
	1kP2cjKVn6tXNFRI8hc0zcZczBhR2xeVZV93KWwGrE/gKNlImqavji4VZYWND0R9
	tz53WsFvGz4myw4IL4iKk4l+0TEV6lhw37a/k79IlP12PiUg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekncbgw1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 05 Jun 2026 06:47:26 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso1731933b3a.1
        for <linux-firmware@kernel.org>; Thu, 04 Jun 2026 23:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780642046; x=1781246846; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7LPe/LYlKzoiVBJ/h57gPJ9p3ldaFGvAooEjplbZo9Q=;
        b=fiw1O4Lv4b9dgr6PBjMWRT0WVrOBJOFae5FD9cdbw2F6rqTkNNIkesHTWYpJmBobG1
         VPeA2trr+DqkEMPDEmadEa4aJvF5rO36Me2/E7kXWHXKpJNTtGP//Ici0pcG3/WgYOIa
         Mr0DKDv/EM1Ht0H4IwdEesHO5F7YOvEYza326ugV+Kd9nSOq4BGk0up5qfGNM1yprnoG
         Mw8YCa+UjE+a/vZz42DJNEgUJUTlOcQAIRCAT7gqsdZoT/+UsLv4fWcYIzfuhFHW2Vlb
         i2U5Wr8qY2qkPmWrT7aohN6xjjZ88NiYjrbc069E8yGgPh1q8BTo0qoJ52E+xWqhiSke
         cI1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780642046; x=1781246846;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7LPe/LYlKzoiVBJ/h57gPJ9p3ldaFGvAooEjplbZo9Q=;
        b=W/9d2W5gvaAYrEjXocYa7fYwPvUklLZRo9xPNIkeCF3MoT7van133Ol4ZZIpXCoRlp
         3LSZSX5K6JZohhAlqNdKFvqzgckgUI6jmMTtPHVCEMaxq5ecyu7I/8wmglAM9YVyMipo
         owxNeiVz/8+SrDPk0BE0vgUW+qa7yxWgPwDz74FdgXMuH6Apa6WqliO9tdkBXVcdqJI1
         A4yZjPRWQrVtQBPkmcaQl5kt0ydmaHIgS/OviX9MVuJTi1KJChlbcyPNk7oRog2oAn31
         fmgOXVTcVmWOtCVBIxFe2Gjn7VPpkRUa+0KJkswFl4eVp2h+Rub3gUbGVoAOH90j3W9t
         XNMg==
X-Gm-Message-State: AOJu0Yz9+PtELjeShKIIEHDtzmqCXrFQ41P870QkP4Dr7uHPIgmaua5K
	sYUqgVi1ZSk10Jap4gltQj3XTjttjbU5cbszCotiCXdcDQH09TC46HsNvWWAXE/hL0GhYlfRsWB
	MCRTOog/cf3etB5YRtCrDOwp6byA1uz8v3KUtvN/ev+Scl4nf4VNGOyA0Z/xXFZDs3f2+xMs=
X-Gm-Gg: Acq92OG+BPnHSaQlCvUzecJOkWYjNLlF96osraDFKdWiEZIVI5La6AutdASakx7hVao
	wqnr/BLvmuzxiLcQSKnOUqSeku7+NxlXXRpJfBqmtqnPZp89zZdZF97Xg/wby/YYv/MCB9m7P+/
	BU7OQjzAQQ6JEFvIQFe7FI8V/FB6ml49rkspbcNuq03G6VtseZyf7izpd66laRIK6vr9ps4WL7b
	95Lx8+d2cKUHmTCNKIID3x3guxg/oCIuUda3Q336NXjVXhvEx/zDbr8N7PVSUXpAFM0IO/2EyrL
	kdDwb5Ntzgcl0FdmoZoB1ZgFMpuGlNAHaekcKTAh4Ah8TrNv53xl4s1/C05JIVd6e5YmWA4jAi+
	P219wdlE+v3IDZg5kfx+2+oQL9p85pKHeMbFChi8vqNYPCDLAgZuX0gLk9mq0tg==
X-Received: by 2002:a05:6a00:cc7:b0:838:1ece:9716 with SMTP id d2e1a72fcca58-842b0e11ab5mr2070108b3a.22.1780642046239;
        Thu, 04 Jun 2026 23:47:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:cc7:b0:838:1ece:9716 with SMTP id d2e1a72fcca58-842b0e11ab5mr2070086b3a.22.1780642045751;
        Thu, 04 Jun 2026 23:47:25 -0700 (PDT)
Received: from [10.216.45.215] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842822222ccsm9627466b3a.3.2026.06.04.23.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 23:47:25 -0700 (PDT)
Message-ID: <c5d3951d-dd2b-449d-9850-7a4a0f0e680f@oss.qualcomm.com>
Date: Fri, 5 Jun 2026 12:17:22 +0530
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
X-Authority-Analysis: v=2.4 cv=OauoyBTY c=1 sm=1 tr=0 ts=6a2270fe cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=qC_FGOx9AAAA:8 a=qBBv3P8nucFailthiGIA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA2MiBTYWx0ZWRfXwfviHXBMAVdW
 FDXxRCYqalnQz1l/kt76RzdvRvXJJKHmN4rRfEplKSajwWR9lfSFJBnJDNN00WDCF2V9FZRDZOq
 nnf8MYEpINlHSHs+lEAyEnaDCOZhttuKl8tlzOi5k1Ih+tsqzkf41gzpY5zKdfr4RrHk1GnCJKO
 Nk2+M+795QdCRnyBs/QR0MiwFVHAKoUU1cJK4xi2xZJliSfJy4z+yv1YO9al4rVD2VeqcQSqdQg
 eeno+HJKCfWhupIV16u+xVOmfjYAwjARbDr49HYaF4pOsRj6TBiLHLua07ahAAlK72YgIH4H0CL
 LLYQAh7CC5xNnRRpB248hAMEQkTaEB+Bbhhulnp/q57dIBQkylLF5BjjBud/20RYZgN3A9j6TwV
 fTY+iSOBll1kzt2Xi7unULeoGkzOuQr50xuJ8Esy5lcQN/ZUD3Hxi7NridECD7EIbdl7kCaio+Z
 TJg3fNGZbNX+JDX7gIA==
X-Proofpoint-GUID: VSfqdHdLp8HO3ZANMNjijphkEF5dufM7
X-Proofpoint-ORIG-GUID: VSfqdHdLp8HO3ZANMNjijphkEF5dufM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050062

  Merge branch 'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-lemans

for you to fetch changes up to 8ce6db8cd6564895827c199635fd94401a9d4d98:

   qcom: Update DSP firmware for sa8775p platform (2026-06-05 12:11:41 
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
