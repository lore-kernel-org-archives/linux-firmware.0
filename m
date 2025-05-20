Return-Path: <SRS0=18vT=YE=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62610C3ABDD
	for <linux-firmware@archiver.kernel.org>; Tue, 20 May 2025 12:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A8BCC4CEEA; Tue, 20 May 2025 12:44:08 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21B49C4CEE9
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 12:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 21B49C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8Rpvr013665
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 12:44:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QmTcft2iDspeUNUnYLzAhTloIP8QCNg1JRKIHnPU/6Q=; b=luKO8fsRs7vqTywA
	nH+a8w6GvVvTcI15tKVdyQTLftYACvREqPfqFVj/MwzXwfNpWF4KDpxdtbR20JcQ
	vorRbMVPYDvVmy/f1W5/hGbze165xljFXNqmcFSGqrXa9MCzD4CxH4w73eXIp9fG
	bNmH4v8fl4EMx274QD96rJOCgMlHkPPdHwkM1hLDHpzmCL/lXKsjgpLPB6lI5+CV
	kZ8aymLskvhTRjDUHE0nDeHH77C+RIcLr9xEifPlXg7YTIfGLUCDrVdLe0uKXjeW
	tJuMkuwUnDs3nhLgsMg+IH7mSaSX8szGRqA1t2/kQUktXNVoNvjYl2Q0aHTOEyfi
	hEySmA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyqtxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 12:44:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2321215e4c1so24212995ad.1
        for <linux-firmware@kernel.org>; Tue, 20 May 2025 05:44:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745045; x=1748349845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QmTcft2iDspeUNUnYLzAhTloIP8QCNg1JRKIHnPU/6Q=;
        b=YDNLmOEOsMuLfzK9NtpMU4ifnHgMnB+X/3w0y8Frh3gXgIOwsSLWUapizkv+DXuRRs
         roIYXBO+QBdGENYWizWdtyn+1zTfxWtdfsGTe34dRB5YI9ZNcQDDjCAqTY3QBX3l5vuV
         2kz9bAUn+Tsf4JhHnc1EfiLQ8lhR/6jr0ERxyrTYRjyzQEROiuhy3xyVLwXkLJxKFZPg
         LycMvM+oP3/tCegvikS4r8Deg3Z8lzXXPHCI2Zr1biUGrze61s5XeEVZNcmSCmwgsxW1
         Ve24/TrJLzLOI/7nnWr8VS55cwM9K/E9k3Xj1z/wrcCDB6JS8nVwczCAr/+wzVvK0eX8
         DOgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhj36QX2YgWKhwAbNpwdOHb4MmqcnwjDxZ0iIta/J8pn8wVt0KO5McDpJffFT3KD8FP6naouITVxJh2STs5w==@kernel.org
X-Gm-Message-State: AOJu0YyH8gkc1D58tUf22KLbNdmFU8BReqx4Nkgg2B29TluR9Mlu3kVr
	atxRIl1rA6wWi9o8eqt9kKVf6DHhz3XajSH9YIzrExDGT/0kQU886bbcitEEM5b83Kuyfg/SRfd
	5O/CjjzO7qOVlB5BKM/1NHnfbZk9zTYK66oVxYKLe1+zae4edRLjiTO4dgS0nd1v2O6/6Sg71K4
	qf1GBuI76ets/HdcPAHoYvbS3WQG0M10+L0Nv/Jw==
X-Gm-Gg: ASbGncvOOc4BIr1qkoQkexpsATxkm2HJEA7f9sIOU226OLBwOMTolSJsP59+8YuHDgW
	C9XTOqPWjjMHdqUF9VMzKzWEnh9MXHFeEp7blQxytgMg7XLXtf3Dm0JeytFOzvbROu8eIOA==
X-Received: by 2002:a17:902:d50a:b0:215:b1e3:c051 with SMTP id d9443c01a7336-231d4d15881mr206877145ad.11.1747745044927;
        Tue, 20 May 2025 05:44:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGunB+iwilqEsAWShRL5MCUIjOHJk9oFgEFanaI1dfncr4gCNzPLRgmBNUYgN4VooEwcDHX7TPriubeVxf92XE=
X-Received: by 2002:a17:902:d50a:b0:215:b1e3:c051 with SMTP id
 d9443c01a7336-231d4d15881mr206876895ad.11.1747745044542; Tue, 20 May 2025
 05:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <7b30419d-e801-44a3-86a4-b18da83ad066@oss.qualcomm.com>
 <netxlhikdd2jlievf7mevbbfpffaz4ttkjw6eykwvpklccoxbw@qtzh5hiqwcpv> <CA+5PVA5ndCY3gzjmUAD3_=yb4Xa_NUoAFxddvWJLgvZoy7cObQ@mail.gmail.com>
In-Reply-To: <CA+5PVA5ndCY3gzjmUAD3_=yb4Xa_NUoAFxddvWJLgvZoy7cObQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 20 May 2025 15:43:53 +0300
X-Gm-Features: AX0GCFs2MxXLsY4VdzW3x0eir5sXU8OqxtfAFzR6dtizHDcbhTHAb28-hW0YEys
Message-ID: <CAO9ioeV2FAmv6_K5BfE4=syg2XbAm8A3X0W7jU8M-jhN15547w@mail.gmail.com>
Subject: Re: qcom: add QUPv3 firmware for QCM6490 platform
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-firmware@kernel.org, mukesh.savaliya@oss.qualcomm.com,
        quic_anupkulk@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Wvrt81U6uImQDZK0DnKBEnzi3smXGqaK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEwMiBTYWx0ZWRfX0oPyuDIDtfab
 RtDOuN7l4c9yyzqDOqyEbMMJqseYvN56E1+VyZAB9MDw8uxkW0z5VVpKh4MFnHm5PGO4wRCNCpj
 XWyXWJ+dF3antTZr40hSDR2zFf4pOpU5AEQBWy3EkT7nlgrJCZU7rxBXF3VGBz6Mu/jwh1TYtdx
 2plCTYWmCcPAX0tzqxxZ6XryA0S1HNya2d+5+nsS6FZ+WZzxBIqPV4vVUcrAd3YV8Vl5rVZah7a
 +uSZl4JsND9ddTkUSxxyIxU3jCC5YQMFJonwbKs2tn1PY5a+fZ+ISQ1iC9PwbWhpuZeH1XB0gZs
 R75dHYbeHy1jq9POGehHg9Zi41/Os2WWRvpjgy4466kOXA9AwN+Q0dlsVg/bU65rAhqSj0jG7gx
 13J9L+PM7Zl+6K1N03yyZU7NL8FKbAMJzIdrbD4Py7aWHf9z1qxVeqG1r66dORgEDkgY/9wQ
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682c7915 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oQeUk3lh8Reb6gpKbNYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: Wvrt81U6uImQDZK0DnKBEnzi3smXGqaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=837 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200102

On Tue, 20 May 2025 at 15:43, Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Tue, May 20, 2025 at 6:48=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, May 20, 2025 at 12:51:47PM +0530, Viken Dadhaniya wrote:
> > > The following changes since commit 759c4acafb4a80d76885e4a1542229a27d=
677322:
> > >
> > >   Merge branch 'robot/pr-0-1747425243' into 'main' (2025-05-16 19:59:=
07
> > > +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > qupv3-fw-qcm6490
> > >
> > > for you to fetch changes up to be949ef4113e8dfabafae6313f6bbe88520f48=
3e:
> > >
> > >   qcom: add QUPv3 firmware for QCM6490 platform (2025-05-20 12:07:53 =
+0530)
> > >
> > > ----------------------------------------------------------------
> > > Viken Dadhaniya (1):
> > >       qcom: add QUPv3 firmware for QCM6490 platform
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
> Mario merged the original PR already.  Is the only update the change
> of the driver name in the WHENCE file?  If so, I'll just change that
> in a separate commit.

Yes, it is the only change.


--=20
With best wishes
Dmitry
