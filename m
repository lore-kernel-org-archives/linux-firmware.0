Return-Path: <SRS0=EM2Q=GY=oss.qualcomm.com=shuai.zhang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE96CC61DE2
	for <linux-firmware@archiver.kernel.org>; Mon, 31 Aug 2026 09:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD8561F00A3D; Mon, 31 Aug 2026 09:38:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788169130;
	b=VLuLkZSXuNbnKHiRRn0YvHYY+6eDr9q7aKmdSHSA4xE5Uzi9NZckAqSzp9hcfBf33exh
	 rwWH/I8f3aM3L9fAto22rr6Tyf/OnaRhwtyzIOGcC5D5Fxkxj9T3PGmdzJJQACnbJrIME
	 Jl+WqjKm6nD8SarnMSZRi8TmgiTeEPiTqICPD+ZttxWtL69jL64kkiDKn/QcG97pT6G5Y
	 S/TatHc234ALK5xdOMQA3PnCsto+VtQjfGJyQP4F76ATRi3wri/oK1lmWvUkr7rtb1cew
	 gvNkKyVpZyFK71k+o/pTn37bA59K+egbWIaio2ETcg2DlqcGHPq6oentnNj/6nAzgyA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788169130;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:List-Id:To:Cc:From:Subject:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jAfZ6Jeg6T3rRJPgIHfGiWgCgQOdbw8QeQ0KaH/RkOA=;
	b=u+wewk82a8vhfyP5dbsdJmC6qVw6nFV4qOr9PptTDpFALnPmMbHLFm1g+oKLIvDJkEUE
	 cwuzcylpit/LQeR0t/5rfkGwEwmVWZCJ5axMdJ/ePJhNe+NFWBh/VIHAjp+wEFYHYOLDt
	 rb3f0fp/SqR37DnmTHx3dGn92jqiGr+ACBpP+lropA/4zfMRxO/7UDrPzjtSKh/h5jyJq
	 NhvTTeJmjiuJgRUo+ISKm6P6OQd+P35TNMi0s+GLL8fKaakWOaSCoIpr8DHc4Y4w5CXEw
	 CKUKr8KnCLMgytFnN6JxmUruHK7L4cm77KLFBcS8R9FFFB0ldCMP5QxphzskKtO+MOQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LfMXfs11;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvGTr8nx;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 156621F000E9
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 09:38:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LfMXfs11;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvGTr8nx
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 156621F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V9IZFd2026322
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 09:38:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jAfZ6Jeg6T3rRJPgIHfGiW
	gCgQOdbw8QeQ0KaH/RkOA=; b=LfMXfs11GyYk/IUL1cOTAtASCJwWTvfHTFEJmO
	bhMerzVDXma/K8CsdXDJBMcvI/8w3cZpdkWPUgUJYvFw5+S23+agSM/4YcPn8o/I
	pMPkFntuLQOggIkVWpO4CIRMuAQG7uzmf1m1NPZHxnhi+G1hJ0jVsxjKkqicpCck
	1E70kLjpD620upQ+mhSxZHQKEA8kqykMI/qrzFClmp+jjXYFmYgeE3qn5IuSc8SZ
	fE3dOSZV73pbzP6vNXrR5aelAlbqmCLMVPkptlGyA/RunEaMqd92Vr9oBohWcT5V
	gfBY1oPA27buUiKEtWTb1AW8VAI7jUiUe+OvhloRvNx11acA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vag2u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 09:38:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so6381081a91.0
        for <linux-firmware@kernel.org>; Mon, 31 Aug 2026 02:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788169129; x=1788773929; darn=kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jAfZ6Jeg6T3rRJPgIHfGiWgCgQOdbw8QeQ0KaH/RkOA=;
        b=AvGTr8nxVp3PPCfPblIzzYTjtR1kE+tecbmDTDAX8I9OJn9pGKaICEEcJiXqTznRzT
         NoueO1ImqVTe+AF6W2fCd2chfUZajDthGC935N1VKZK85UOiqnHqEjGiy4lQYgDYIDU4
         nLrrEBIRUzgkYL5yA6Ga0/LsmLTzuAPPVqyclMYACG2k+ZQKv33oKPi312StNJe0fDus
         STlT1or4pNsp+84jzyk36KAs42/YDg0cgEXfnI+Ptf4y8FxhSwtVf3pR1LPLDnOQfA0U
         dm9h8aJC5MfRB4gnawrqNnSmp3TuuYbaDWcc7K9pwJEstfzXI1OI1cbWcUd/FORaXKt1
         ge8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169129; x=1788773929;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jAfZ6Jeg6T3rRJPgIHfGiWgCgQOdbw8QeQ0KaH/RkOA=;
        b=Mn9IvhfhhOUWkwgPjM2ztRBfKglbKBI7uN2u30D9lVH3Ye8faNJMaPwWRP4IWhW+1b
         a1yEF6vz6NNCfrKtV9fWqgLrq5CMeXbdkC3oTJ3ecH9rLXqe8pBX4eD0ubyx3Thd4LUJ
         gpDTia3NeaCHh8DTPAsH8LoN1D1ZZF3gYDpuYR/3+392u6sccVhIaXD4oMfGm/jn21Ac
         JFUXMjG6jxfnX2FEO2DLHHBpSdmVzDgPgZDXspnzi4dklzpFbB9Bn+pM8Mtw/n6XPVNe
         1k/pPT14ZjB0bVlNcZ1vcsEVEywynVTY72BY7RxBjtY5hK5TTOq+O9QXB4vOiBVBw3p0
         wuoQ==
X-Gm-Message-State: AFuF++lXjBkDaC7ruJ3ffFjs24Nhn8FdfV9ZaWiFRyeqZllENjMzP+eQ
	7cgXigCwSQiCnxMaJK1hgnNPgETIgQFl0CqdbtRDhUkvOj20YQlhNnHOVS5h1ag7kxyT3DfA+oB
	FuZytEneUR0A5ph87gp79LuktAOS0iDzu5UiLu2bPt3FMtafjYoaNcSfwYRDDc/eAPDn6aXc=
X-Gm-Gg: AYBFou3aUT+EOuF9t/z2s9Q0P93AsAPq8i7/OqvRLEQ8E9B3+ddSL3+GlXFafB4cozk
	VUKK+5931PgNASvmdTNbpaLRT8tHDsZhoTO554tSChJtm9itBn8hsAhI4QEe7HVIZyzhfN6FhXW
	pZkAgjbP66qVdleRKoZOw5h1282BJdmK5jTsGqJfaPeSfptktH4KI2GaO9n0m88vrHcPEIwotsg
	eqcHTh/Y8EWzYECDiHQiF9wnbKr4qtSQZn8A1U/ocebWekxkVenjIxbsc0eBlQ0qDR4ClI32Tb7
	3CQELgAbzyWUgJP3wJiPPhMQip7wMUoEFnxbvHddt2UiQyJ48ELU2voFt5xr3nEqllsP1/kKXcb
	lIGd6TSUtoFoJLy8rrVE6ARV064k=
X-Received: by 2002:a17:90b:39ac:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-398f8273f58mr2848450a91.9.1788169128527;
        Mon, 31 Aug 2026 02:38:48 -0700 (PDT)
X-Received: by 2002:a17:90b:39ac:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-398f8273f58mr2848404a91.9.1788169128036;
        Mon, 31 Aug 2026 02:38:48 -0700 (PDT)
Received: from [10.239.97.158] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398a14d3e83sm13638813a91.10.2026.08.31.02.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:38:47 -0700 (PDT)
Message-ID: <eac4e82b-47a4-48df-a8c0-445975a14f5f@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 17:38:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Subject: QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c request-pull
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4MiBTYWx0ZWRfX6E6eLuiyAcCx
 3FUpb/v10mHji70bmCS5Gi02ebHBFti8j9pEZyCj5b8SdtjMuEYf1OQ56PuD86c9gojkOSP1G29
 kfONNhcFYxREZncfe6oJAyv94E3PzExE/WJXl9SEk1ciOcEKKCUi5Tr+cVGqKt5bAuiJlIfJAuG
 Iw+hhalXjYu/8PvH985Wsu8yqLZaqOLxOc5r0ZRheimmcTN6rXt4GEAHwFRUNQLnUxlG48KckSN
 dkIUGvsBC1uoJjgeHhf+eR3y3Xl3hrzxojvEKxrFA4a4dFPB7GpPRi4irzKyScl2nOXaWRwb3iE
 P6ZrBtSV1n4fDOGoS1AT7Za1JAEUDM9sUYtKYthIYIbg5xhaFVSNcovdJEi6zlcEK2c4afAxN/s
 s6BF4upYI8SgC9k6/9/F/UOH0+PnLooM+8k5P+S+1ibeUTAxW6lgI5DK++g5SNCnvj+fLAv5W1k
 oW1XT0A9cMKuOC0xJUQ==
X-Authority-Analysis: v=2.4 cv=YYmNIQRf c=1 sm=1 tr=0 ts=6a954ba9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=ZfgE4unx2aD4J01IelIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4MiBTYWx0ZWRfX9sIDA7N/mUGC
 /osPBNFsG05tzLRbcpPuM3Cw8NunE+J8QPwlVVeloCrvK0dRxUQhI3OAxSt4fayc9j6oBLBTyMp
 mO5RISueOsJiY9MaNSSDKTLmNrPyOoc=
X-Proofpoint-GUID: CvlErnIdnTFJuTIYWuagLwFZ1jBwx1UP
X-Proofpoint-ORIG-GUID: CvlErnIdnTFJuTIYWuagLwFZ1jBwx1UP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310082

Hi linux-firmware maintainers,

Here's a pull request for btfw. Please let me know if you have any 
problems.

The following changes since commit 6afcbccc10ce54c84fd06ece157a4f767138f898:

   Merge branch 'unparalleled' into 'main' (2026-08-24 13:07:23 +0000)

are available in the Git repository at:

   https://github.com/shuaz-shuai/qca_btfw.git qcc2066_fw_v2

for you to fetch changes up to c13c658e2b8bb1fd0d4fb1181461a0b38fa1d4c5:

   QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c (2026-08-31 17:31:54 
+0800)

----------------------------------------------------------------
Shuai Zhang (1):
       QCA: Add QCC2066 Bluetooth firmware hpnv21g.30c

  qca/hpnv21g.30c | Bin 0 -> 6458 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)
  create mode 100644 qca/hpnv21g.30c


Thanks,

Shuai

