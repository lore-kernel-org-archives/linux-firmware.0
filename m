Return-Path: <SRS0=KGr8=EC=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1774CD8C88
	for <linux-firmware@archiver.kernel.org>; Sat,  6 Jun 2026 20:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B044A1F00898; Sat,  6 Jun 2026 20:56:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780779362;
	b=ljoA+jADy7n1BhMulVQvi2Gjbjg2d4PGEp4XGwVH4weK3UtrUiUREPxJKX5EO8uKSRMV
	 DUqp++uxdjUfwjjyBIFIlhSFxmWUYP88rFurWW9oVluRYRA5wesr3ZURT22CbYcaz1Fg/
	 kXgNbJt3h5IlvJLgLuHP9hF0B3Bpm34SSbeoCeJo/HCmIVJs/cExgJzZSE5PHR9tdCRXw
	 gPX7J2JyCYsFM7kuiAAOMCzDCwa81sdoCSnBrkFUDFhRIwh6JVOyEKVyod300x3mgFyQM
	 QWt1CcPFLoDtLmsGMwsRhCVkUV4uGej41D8ntLVdlh4oIZJrn2kKNs7mEHquBYYs9jw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780779362;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4IZLZ57Wg4gq0jIw2hIS5SXIpGypP5zbqdRqI6F4Yro=;
	b=RSSqCB+HupHFnU3o4pNydfLigJX8FIx9kEJ6nH3/CxMAXovW2GF/kb9jeqkHDRLjMO7i
	 vOmNmBI9+P+UKMmyifMSPSbNUEA9vm77m0QetWRQe/aOJjO+1LYb+ErHr+uf9X2geq8E5
	 D2PHWSnkCxmdLavJdgyfUAEyl5Eo2Vn8OKayCSwmdWz7bQ9/TFSbzK/DiUkZ6ZOn8AORc
	 6F1MqDOVzYGmdw39eH0WBSEs2a7kcpxtLh67DlRrM5/sKszQYyfk5yspcyVVijC+2v9Gh
	 rN0ct7xq0x6Kor3ZF5FPEYDPSOFRzwHfQdwRO5TA9xssc5uVN4XKap02B+cGpo3aduQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FzbGY4Ny;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=inqJI3ft;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E79631F00893
	for <linux-firmware@kernel.org>; Sat,  6 Jun 2026 20:56:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FzbGY4Ny;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=inqJI3ft
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org E79631F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656IhfEk2167920
	for <linux-firmware@kernel.org>; Sat, 6 Jun 2026 20:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4IZLZ57Wg4gq0jIw2hIS5S
	XIpGypP5zbqdRqI6F4Yro=; b=FzbGY4Nypp3gA8YhR+X/b3aMZ2mK0hlUctcE9T
	LIlcvmia37dZATLqttJKgQ8Gd6Chj8ZpLf1siaVfeDuYRa9+iUh+45fPEnUZaK7t
	PQxbK907H4TH4OXddi6pvoAbQOUvo4hU863tSHHsG4cpL84r9uGLckuB8sVlBAGN
	bBozwWHS39WLMWWro/xZRtY7dOJKYUb7wzL7AK/osGjdWdue5gwV3qbeH1f9xF7W
	swL2+wK1NawgMC+FWT3M6j8vHMsWU9YLnBXNxJu89/cXiIBCieU6mTyki2llRrJy
	AevfJEtr7kI7rnI/Fq62QWmvPAqi3/JzU7wjepD/j3v3lDIw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadsyrh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Sat, 06 Jun 2026 20:56:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b7f696b40so1891260a91.1
        for <linux-firmware@kernel.org>; Sat, 06 Jun 2026 13:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780779360; x=1781384160; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4IZLZ57Wg4gq0jIw2hIS5SXIpGypP5zbqdRqI6F4Yro=;
        b=inqJI3ftVxxr9B++YQ19mexMHFV1V4rxbzn8mGlw1pCI03BnbTfN2C7jK9S+Bin13t
         99eFvB55InKbrSrxCHh5ZeMKcJQEN5FAh9g5maohd3U1rTQYAPf1K97qeCoG4hU7q0Q1
         MsH7DF5KbyDdwDSlKTxRCwQBt32hRjYtwJNBKAoKFcgXcGlKqXrT/39h00e+3UKAEgem
         QEcluI17dWgQNKEIoyUxpElOaS20AGO6mZ5m1JvBjOyzl+spDMrUAP3gbix4wka7LbJ/
         Q7DYBCArOBj3BnmSdZBKqq3KP1S5c5tGomwsgyRZxDP9BehmrUw8nR7NheSEhVrovj3z
         g7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780779360; x=1781384160;
        h=content-transfer-encoding:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4IZLZ57Wg4gq0jIw2hIS5SXIpGypP5zbqdRqI6F4Yro=;
        b=PxMvBQlIcQxDHrcu4/hFf6MkklpWCpbK4oUUZzLUdbUDzknAbvKijCLCUAP6B4JCav
         kswJoblzP8MTuW6Na33CLzJaLekAdoOd+GiM7AEhgRtfR8BVbpm0olXaF69iGtV4ua/I
         dNDK7MvlmtDS72yhn0ubGafrnpNymptFPP9uyalAMGoByEl0zkyDymCIsEf7erELvLgi
         TiM6ODGyc+0EWouUYz5frKSbLnj/+cmsOUuyawMZyn9CPOilKj3/XQ+IcaUTnHMyankB
         QNPzWtq15iUdTgaBFWajJULNiSjGdZti25fImkKmt9jKkbEH39zCGwmL67ROrYMXy9xS
         G7/w==
X-Gm-Message-State: AOJu0Yz2W3axjEYgUSqAovwiZNpEkxfMustNVR5Poiki2xqV25xMNk7v
	TcrHW8XeabiYhEdsx4291US+A1QFPkr9Suy8qDcO+78IhhfEo3nZRTqnRmvARur2TwK6iiy1rvV
	wyuBJjNDb9xU3cluehUe1wGNRu/Wj98yJMGG3WtFXKpvIQu8iUAE4Z9S2uOxeuCMZV35+nf0=
X-Gm-Gg: Acq92OE/0Nb7ZzlqNlJ8FIPCXqC9leyrgaPzSfJScwml1ygAZv1ggNHWIeVdghb574r
	Osjj9MfUtvSaz2aaNZOv57z1k9wnHm3hNbxRDTLkxL0C4O0sQPf/CIasmwkpEZF1lA6siCO1zXp
	qWpUBo4p0A7Dm9deVkxOjM5jKCEMvyshILCGwiSMRe8gp2cMCycX7pNSwBW5LIrHFSPb1Pjxc4P
	1Ar/ZqaiuqRtuNLGRQgOr7Y87xlQH9AEC27yZDFPs5+aDh746GUNNeks7NHBcBYayf9x+DPjElx
	h2N3Xr/XYIMCDqRD0f4slO5XpPgQLVQsOyEHlO13wa45jXJNYlVAG8euftWrjCZ/CDcmroSXvfB
	vd3PdQvrKsaKkDN6yfWVKCOIbpZuQsh10mSWL42FYF/jycOb5yBJwscsNtXytLQ==
X-Received: by 2002:a17:90b:3c92:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-370f0e4ab94mr10505406a91.24.1780779360244;
        Sat, 06 Jun 2026 13:56:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3c92:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-370f0e4ab94mr10505396a91.24.1780779359759;
        Sat, 06 Jun 2026 13:55:59 -0700 (PDT)
Received: from [10.216.45.215] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c76f55asm10833355a91.7.2026.06.06.13.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jun 2026 13:55:59 -0700 (PDT)
Message-ID: <24b6e1e5-5d2e-49f2-8d63-a921eaf3ab3b@oss.qualcomm.com>
Date: Sun, 7 Jun 2026 02:25:57 +0530
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
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a248961 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=qC_FGOx9AAAA:8 a=NOYKUgO3uHWb_WrQSKsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 7Mwfy4bmFYw-sEQelE1VW_OydbexF_xF
X-Proofpoint-ORIG-GUID: 7Mwfy4bmFYw-sEQelE1VW_OydbexF_xF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDIxNSBTYWx0ZWRfX9Bbe2yiVT8q0
 GFFek2y3joOZr55kkYA3X2pf8gahlh/ERYtxAu8+5rseWYihFTEHflT8n7qz8lkkgV815IgNRsr
 hg3bNNBq7PCpZrt/ABG9AhZFc0Y86BUJkPkpNvH0TUBxPjbiftHdzAJa7Q5AL/iVjCw/kr2CsvZ
 SIo9fyby1QKTS6IuIDJvOB2H3gO28NTtjFG9wDk46oJv6BnIprq1QrNmTQRk6Vv3+DnwAcEZcza
 KUa9lWhSN7Yi4prVnkDX6lwVySRuVhupws03kbyFzbSrcni3f2LSXm1E1DOu/R74EAIt5Vkcvke
 kB88pfbFX1cJnGx2lvsx3bcFgz4qcSH9g/2s2NowIhpAKnEX30EttGukdHCaNor9mnCULhSkSOV
 JOe4sA8UanpQ+bBzWQyWC5eMQyK3uTih8Gr8GGJ3066dcstKYooIIJ/YDDoeD3YTCw4K+GdGB0F
 h7s8qHpYdglreHg/QNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060215

The following changes since commit d953ad875636676424a622ab91cab51b97a0f50c:

   Merge branch 'orn-btfw-1.1.0' into 'main' (2026-05-29 11:11:05 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspfw-qli-lemans

for you to fetch changes up to 1aa3b79c6c4d0cc5df27be6cd6ecd3afb380c477:

   qcom: Update DSP firmware for sa8775p platform (2026-06-07 02:23:32 
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
