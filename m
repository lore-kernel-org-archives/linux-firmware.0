Return-Path: <SRS0=0WVS=G7=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0B3C79F9E
	for <linux-firmware@archiver.kernel.org>; Mon,  7 Sep 2026 06:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 987FB1F00A3D; Mon,  7 Sep 2026 06:22:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788762151;
	b=0d/B1RojlIxrP7PkJKUaf7HOs7OkDuzpHbtP9+5jR1CeoAvT38BtGo3QAK+PeG+/UEJS
	 a2wi57NP/7bxcatsqxjqXyweSdh1QcZRNWLoAeB8xeKGGXmwI9pcTMrm9AE/0UuegYyye
	 IPUanFNcl6RumEPsL5h8p1hn2gxozuBD+5T7mFAUp0sUI4oIOMRfu0z859AbEEIsP9iVx
	 9aD9N8+hkErY1XEsj4SaGFszNe2GINDMf9YJqKPDXATJWzxRMQ+8do26novLtdT8/9mtX
	 iLfrWNBGfPdHdl4PSn6Ya6cDK87RabayuAbnwdAw/4tSvhIyhF7x9/hwss+hyMHF0/Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788762151;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Content-Language:List-Id:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=dqtuzYrjUAORq5FRior1gnJdxAUQN7eCWTpDV6gojTE=;
	b=0oEO1YmVjfKJsLBQcv3cpSWkGk+X7zxS6rta5xmpSc7KKghtEMBnIby2RvAHOnt3rpq8
	 AwaD01PFinfn5oaDkIUX0LyLTDSKKRL4s1CpkVF6Cqxy59xdCi2Q3LK1irnDICjYxn0G6
	 75PdNKR+i4HTa/dTo6PvCzvkjPbEUK3jky74D6DPRyEL9+V4mtqyX4a6D8v2wypI0oRqt
	 leT1rympbOSeeILOErCWA7mVmA+I3p6yLOa7hauSEH1MGl9xW27oNCGXslpGLsrkpSL/M
	 9T+W8FfH0rXr6cPdX6vnl5Tr9mXyGKQgUXrMoUMde0Fptv8GNW/6vNFCDKxsplsa6zw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yz4HP7K3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3TGBg9j;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F33331F00A3A
	for <linux-firmware@kernel.org>; Mon,  7 Sep 2026 06:22:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yz4HP7K3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X3TGBg9j
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org F33331F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l5Id2390350
	for <linux-firmware@kernel.org>; Mon, 7 Sep 2026 06:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dqtuzYrjUAORq5FRior1gn
	JdxAUQN7eCWTpDV6gojTE=; b=Yz4HP7K3ng6Qbkp3ZFpkHYxwXi1bqUqwTeBIV3
	9mrDvjCEo7UTOMELjGABpvet+dDZhlk7KwJjOQ8ZVHWYQxtJuIfiP0ZFaVZpLja9
	VDDbZG9RP6BgeNLZuV1YrvjKmLJ4mfn2krF0VfJgrrpqpz/PtxSO+SA/UsqLmeFr
	nZ7Q0I3s9VLvkTe4UxzE6cqCBZjGX4Afyaho3TPHXeaBFy92GlPOaPA5r842wBL8
	NXOPquUzPXfmYWdvm6D5tIwlRSHzgfv2MaFyoRoW9aGYREeG07qGXiTh+7JNpmEn
	i8wy+OA8aUD1YvzQvNXfbqpJgjO4PXyv26PGg2T73l/JsQDw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuencbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 07 Sep 2026 06:22:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso3945366a12.2
        for <linux-firmware@kernel.org>; Sun, 06 Sep 2026 23:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788762150; x=1789366950; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dqtuzYrjUAORq5FRior1gnJdxAUQN7eCWTpDV6gojTE=;
        b=X3TGBg9j3Kw1ITlWTssxsmrK3ZW/YwKCklRjeBSlpfTgsN6m6c1Tj/lPWxszJRXgH8
         5Xprgg4tqeoup5Qng72aj0a8YdlwxQkxdrTfmH82UCpITwCdqYSB8/kIC209gC53wXSo
         TzAvoHf5W1qMqO7gK8ZIjyxfjwrtSfnJoJWxaC4hpjnKjD7nbBfHG76OtlOI9q5kVlcV
         HJadFrE9h/POkrJCIEeXJFZ5mJxdsNFlcIEForRKQ7OlTzt2gQ0PcEQROQLDORz9vA10
         E/TLTcYketSYVDF+zAiQ1fhHN8xiz6JVHXMinwCOZrW4/3alaRnlcCYL1RkyV+tO8tLW
         0l/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762150; x=1789366950;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqtuzYrjUAORq5FRior1gnJdxAUQN7eCWTpDV6gojTE=;
        b=Gn12ujf1WYaJepUt0GBgEkNm+qx9XI5srb8ji8AGVKh8kF0jMWycQN1l0nCjRmTFVN
         NU35UpYON/PrmyCd5GdXoOY/l8g2dYgfD766MvVUsVgBpt3kVGAow00+4xB+c5zKRM5Y
         kivW8TyTB4K+7gzw08ZX1sQr75Cy1Ec9CvOih/gMMGouaHa2eK7WcLlvHWrtKD2MR0T1
         L42dinHp0fie1vl+3vZprB/wNdq7LJrnBSiHXdxOZftFCy7hSKo9Nnxr9dhpWzcgVVPA
         XeqY2WFGGWGnaf0uveJAjiUQRZSmYbprbXQIxtUxhJlAErbLyjT1bGbD0bPNIpOuD/Uu
         rh0Q==
X-Forwarded-Encrypted: i=1; AKwUvByfX14wRklx5DTlrW4xDp+fDkJs5btxes8i7M+ACiKrjNvPkqxqRC+wa8gnz+pC1CN28do2uWAJJyK3V4+ETA==@kernel.org
X-Gm-Message-State: AFuF++mXxoES4huTGoCJ45qvV0x+xnlK9uyYoWAoxJgRshorMUlT0Gpk
	Qj/ljY545q6Ikx2RhACOmlCaMLGCzFquH8+lXUk8CCvdsAnM0OZSjiqMrlpJ2m2sWi1UMw66K6U
	I5zlT6ADH9GAuf9eWiZFU7+vg4KrgK7ouoxRc6qfMu/clMpHaFFj3uioZsIs3Dr7AVqQZpK8=
X-Gm-Gg: AYBFou1bfg417tszljfA2b3VwMG7AKkqQvOqd+NSqPXo1d3CxLBwMqSc+HR9Wwo+sCv
	W6m4CUH4JQKSu/UlSWNFo90lgvVTjFEgEEHp8lFezvHjpGDDoMUz2wJA2kD+CfKc4pvTVGujvzO
	Z6Y4vUoHkN4+R+wMGDECmkTpIUfGysAS0HU0BTcGoUgihBgPm/pvJhuMy6vSbE98OMwq+3mkl6X
	ZdFkr/TbIZcax4SNGm0e3ww/YB9bJHGw6O0mBvZPrkt8LTjjTp674mbwohkcO5zYBDd7VPCf7ag
	VeVVhRMOH84xo6W5NabtWcPog1zHvOciJwzi22IhdovdJww3IJyGO4U9Ny32d5w/0STztjqAHKi
	8UoY5qRYmWCrilsy5SowtCv9y2K0l
X-Received: by 2002:a05:6a21:3997:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3da3a26d313mr34760041637.28.1788762149672;
        Sun, 06 Sep 2026 23:22:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:3997:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3da3a26d313mr34759990637.28.1788762149236;
        Sun, 06 Sep 2026 23:22:29 -0700 (PDT)
Received: from [10.219.56.17] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324410092sm22692509c88.14.2026.09.06.23.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 23:22:28 -0700 (PDT)
Message-ID: <22cd77c7-8d7e-451b-a689-76a477e9ae82@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 11:52:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-firmware@kernel.org
Cc: venkata.kota@oss.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: Update ADSP firmware for sa8775p platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2NiBTYWx0ZWRfXzJdwrA/lueyM
 SL1a//+EiEvSFKqW+6LBEz8d2YPfaTgZxWSI0SPLdyto1RvizE4KlmS/w5y0bFTM79NpanQY10+
 epjA0GAm96spVrJQw/0ArmfQPlwErdZ5pJGdOkd0WlkrjUzW4/PBLsHQfXQel/XXLumeRJA+f7K
 m/+KQck9yfcs+MWCPMdIFXYkq2p6aZojD8I6l1NequU659gSt1lV9FPbEQ0UmpC5Gc6ch0O5+5P
 vGe0Z8wXCALctPwAXJcViuQ9urM2oVsKoilZJlqkEm9p9r+qZ2ic/iXr7pilCsFTN30tBpO95K2
 8ch3JdaMVo2HskBI8qHA/rG0s1VbIjds/PilMxw/M1i5BlCwk4B0L5y+RmwGh8V+/DBiAphD301
 fPQT/6viy7IgzspPyVirlmqvBeDKavoiHSBn5gSOE+120fbAaF1wh1hQ8Q5cdSw4GSqmw57ONM1
 vDRkXhq7Kus/9WmYckw==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e5826 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=qC_FGOx9AAAA:8 a=zaKaClIhwoY5PkX24FEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 3YIyBIxtG8eCBsIbFM7YgubBp0mDUycw
X-Proofpoint-ORIG-GUID: 3YIyBIxtG8eCBsIbFM7YgubBp0mDUycw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2NiBTYWx0ZWRfX5BMBbSCwbbzP
 ZNe/icyJOkcJ/kahTAnPGUbRcr/5ceXVMtlyrKjFilX6+fhaG7CR+sddVUADEUtPzQLcL09UOMd
 AFlj9McDw5vhKy62J/f27YUCVXTbK60=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070066

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:

   Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-lemansadsp205

for you to fetch changes up to fc3012812ddf47ccf50980fa54ce609a79da01eb:

   qcom: Update ADSP firmware for sa8775p platform (2026-09-07 11:49:45 
+0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: Update ADSP firmware for sa8775p platform

  WHENCE                |   2 +-
  qcom/sa8775p/adsp.mbn | Bin 6803456 -> 6844416 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
