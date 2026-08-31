Return-Path: <SRS0=8S2y=GY=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E4BC61DE2
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Aug 2026 10:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6792E1F00A3D; Mon, 31 Aug 2026 10:30:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788172222;
	b=XPc/NcbYf8oJCMnZmFkhJOqNGk5JqBbl57rwX6ewl0ePQnTBg2nvS8+wqenvC0iB3iI+
	 a/4eEB+YZgpHQDMa6mbe7oWSuQ8ingIQOMyMVL8yhkEzpLtYm3FRp0shZn9bLzxtvI1E3
	 ga+UItWafKw49XyNVONuszeD62TMUSq98MbxJwRByX0Jua9k8BGa3RMtZMTEsiVrOTq2B
	 TavUckyZxEHu4iSZgX2iVtXv2F0RyX1I/Sye/g7bHYurK/skUrJmfozGWHWDfxkvntOle
	 shdid19/EJTdXvCJL+Ieoj/rn7M2Og6J2MWKjrqvalMIckMt44UmdikB1pMhObok3Qw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788172222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Rr4thPGQfRfTh41Ji+1jA3pH6qz56jYXIVHnfdxCAsI=;
	b=zwaPj/fr1Ol4vwm9nVVKFQEusDYyE1teJti7tNDRuE0qaWjwucqdWynl9rb5KFGIbpoj
	 8JG/JDwHEQnZ2Kd1n98s29r9L05vQjXuivKFak9dl4NzH6BTERUZcnVBeQLlc9XtnvNDF
	 WRIJl4D9Mk5KmBUC0wsXEuZeW42c3Sk3BxIK+JPAmsEmIaMwmr2ccF1gF0pfBmajF2UOL
	 mUbBPNnRKwdn8t81dui29iqoiiRvrBaPRh9jbNdS8klqmXjP+CyqAn/PNI0vzuc/Q0gj6
	 +6NBLY+bCKDDeJF9sRp+xTbe+biRJ0MBfx8BV1A9DWaJDGopBrjMVlc0KGNmdmfEMxw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KQpX9rsp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gsFg3GHo;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C095C1F000E9
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 10:30:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KQpX9rsp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gsFg3GHo
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C095C1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V9A60F3182570
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 10:30:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rr4thPGQfRfTh41Ji+1jA3
	pH6qz56jYXIVHnfdxCAsI=; b=KQpX9rspXeH0tugabfG2WW44wdP9boadHBrtWW
	usObvzbfcCNNaLJCaHnzpdcU8p1s1MMkMDDAATtyQRZTVEFmGkmh+Z7bL86MRafD
	yxQqJgPaEQcJZxnLlxJ5yjsWK6N500DyF8F85DFHbe3zduQSzB8Xm4L3OHCX2Jwv
	rjxKbwjTgjgjoIezn2U54uCbL6GQuNFF+UATycpQotEkPQ/wMj9O+m0+jISbJImS
	lShZzG8j+ICLuENttiVnK1v09f5F70Y+uR4At6Cqja9bAlqWC4JR5z0CLR/2Py3+
	5Sb1tzv0WBLHsfuhkLtLcGQIOyMlvf2VxTT0CTpshJmXdisg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rb89yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 10:30:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d7151120d6so904815ad.3
        for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 03:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788172220; x=1788777020; darn=kernel.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rr4thPGQfRfTh41Ji+1jA3pH6qz56jYXIVHnfdxCAsI=;
        b=gsFg3GHojJaPjTQAI6jra5NYBOJ4l9o3/IqxaKeHm28SbbsQkgeTX8qOIYRC487TrQ
         WAvyfi1qj1C4TQwJb/igbT1ffbL+93lSHaN/M31h90a2Vd6atDkd0f2EDh38H0a/R0ub
         u8s7lV1j+49NQ6TKIxzgQH4r96S+5YXtahjBvAbgvQSNMCylb5E14/iDk4aAXFMJxlk/
         4BU7TcgLcRCRU1bct5FWre0f2Ip1tAAt5+1eMEGaKd5YFQLU8Y53kCAvdpmPdHi4kTRF
         7aIZo5N2DPV2h9d2n7eO0Mya3ZsIO7MzM2qzOIhlgdn7Aoq92Pu7CwcvbnShcy56bEJu
         urhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788172220; x=1788777020;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rr4thPGQfRfTh41Ji+1jA3pH6qz56jYXIVHnfdxCAsI=;
        b=PgcGR0RbbYIPFaahUJ2NFk7LFM7z/MtANjlxqaHsFxbkGNl9ut5stJdp2Jnux3tqbv
         tbz0vHn6NGtjUc+eciil2Ax4oVgaAM/4F8qMSuTCAgjns/gjQ0hKOqa3EvianmfNkqxC
         GdEy42lUBm8Ho9IepQxpkIr1ybaMUA8yUPRmRh+NmGME0eZ0b0xCwpnZUSL/vE/am6/r
         7sMXtX1vsxFk94FREca5w2EarffS9fPyz38nuTFkkWmQQ3vLqMjLsgbL8N/+tbJYM+7A
         448eOVIHn/LgGNdKE9iMxLZclNc+mUGDrY3iBGkR1EMPGlodyXYdnoimsfpg6GTktrBj
         y8Rg==
X-Gm-Message-State: AFuF++lGcNCyKalMO74PZf4WI/RKcnieK3S0sIEmRLkOqG9kGidB3Au3
	oVs+5yjT5FLxgw9xjOmTm1x9cSb94mntRY9hFuJi+WgUYWlAouFPrmb/fEweot/xxcqABQSwpJX
	GGrdGGJMS2lklJLrWe7sR57Wxgdvvi4Cd8i8kP9H5sZa8yTcTSBqIjIexAzBgWljcUqtdw8g=
X-Gm-Gg: AYBFou1lxJjup9tqR/KSoTvXiNhaTlR7vONdWznyhm+uAyrwh3bF0Q+yotHsCa8iFK5
	duHsvwaR4r4M1rFyAKbosGCwrg5IGYabZv0rmNeUjYgx7UgO2nBT0canLUUCyHMMTuUocicJG4p
	wtnuKOpNOT8BjxGm6gSfQDQJjQUW9+aVlTJ3qBMC+m4Smcg5Ktk4n2oNXGyc2L2YAsLUjl7uNU8
	fjWJ5PAhWpNu4drj5ITPSo0oOMecXvGT6iIhggmOLc3h9WuhlrZDVzM2IoKOu93AZcXikQU6ect
	kw9+lfL88cK/lSPyNMf6jNWjeWHkFMIlHDRveWoVb7rOsrTct6BYehABqAFDhtbsPSC7Gm0AoKn
	PcUScHnqxEC5LMseainU+CY+PJIBk
X-Received: by 2002:a17:903:32c2:b0:2d6:fb95:59f0 with SMTP id d9443c01a7336-2d74dc6f50dmr366290255ad.3.1788172219512;
        Mon, 31 Aug 2026 03:30:19 -0700 (PDT)
X-Received: by 2002:a17:903:32c2:b0:2d6:fb95:59f0 with SMTP id d9443c01a7336-2d74dc6f50dmr366289475ad.3.1788172218909;
        Mon, 31 Aug 2026 03:30:18 -0700 (PDT)
Received: from [10.219.57.13] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa400c8sm33234424eec.30.2026.08.31.03.30.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 03:30:18 -0700 (PDT)
Message-ID: <10a44e53-3531-4160-9782-f7d62f7efb6a@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 16:00:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        psaddam@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: add ADSP2 firmware for nord platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Us0yiSGF9Ww0nbm4rb0EeGzB3snvF_ii
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA5MCBTYWx0ZWRfX8bEchftJkB80
 lCXYF5YHbc5PSJPgzXtt6BBxY6Crhv3MycNxg2jlVKD+flk0TYfRPG4armA1KnCn0mRzzJsBTeO
 A2XonbxMx3jLNjqlLg1VLZ0vI1PFn5n8MigUQKMBX3izTpzJgr7GWodEd8JpKowzMFq/rXHAWuN
 j2P4XV+jJDmwGjvPWfpIhpFru2WfWcuLyX7g9pBei1ciTzlemo2etOEu7wXKujqCH+gz1MNg0s+
 89k+sUsMY5BWrpCyxrYXtW36az3vI9rCPUkaPu+exsZKiWT9Twr8HYrXL3RlcE2yoMeJzdQU9V1
 91SdV19/co0Gy9GCzLojQFo1moqrjHIKo+xyw8CsBY2y3nFc2wwD5rhy/8u+Wa0Iym822SMMjfA
 6k0UOlY+vscoDrRsUCf97jqnQaPYk2vvx5EAhPnbxSWGPaVj8cWuku/YEC4sNES7sOViG+m1YmL
 wJCgf1qu4w54o+Up0PQ==
X-Proofpoint-GUID: Us0yiSGF9Ww0nbm4rb0EeGzB3snvF_ii
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA5MCBTYWx0ZWRfX5Nvj/DAGCPBe
 XvNcl3zpzYKkJGMqQg7YvcpHd7Mh6AsgRt9iNjNItiRjQZ0n/xgPaL+jfPOGSHxSzFKYUXq7SCe
 b2PzqKDYQwbsf6wbBwzD2gKu33rBJik=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a9557bc cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qC_FGOx9AAAA:8 a=tn0l0lysm750k1-kIz8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310090

The following changes since commit 458e40fdbb4dad5134ec230a42df21aea1b5baf8:

   Merge branch 'amd-staging' into 'main' (2026-08-29 13:09:19 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-nordadsp2

for you to fetch changes up to 93681b24b15639f4e56102f82da073f0bf63fcfa:

   qcom: add ADSP2 firmware for nord platform (2026-08-31 15:51:54 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: add ADSP2 firmware for nord platform

  WHENCE                  |   3 +++
  qcom/nord/adsp2.mbn     | Bin 0 -> 3363776 bytes
  qcom/nord/adsp2_dtb.mbn | Bin 0 -> 40960 bytes
  qcom/nord/adsp2r.jsn    |  22 ++++++++++++++++++++++
  4 files changed, 25 insertions(+)
  create mode 100644 qcom/nord/adsp2.mbn
  create mode 100644 qcom/nord/adsp2_dtb.mbn
  create mode 100644 qcom/nord/adsp2r.jsn
